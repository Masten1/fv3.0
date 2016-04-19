// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    var Facebook, Invite, SocialShare, Vkontakte, fbAppId, locale, vkAppId;
    locale = fvSite.config.get("social.locale");
    if (fbAppId = fvSite.config.get("social.facebook.applicationId")) {
      $.getScript("//connect.facebook.net/" + locale + "/all.js", function() {
        FB.init({
          appId: fbAppId,
          xfbml: true
        });
        return $("body").trigger('fbinited');
      });
    }
    if (vkAppId = fvSite.config.get("social.vkontakte.applicationId")) {
      $.getScript("//vkontakte.ru/js/api/openapi.js", function() {
        VK.init({
          apiId: vkAppId
        });
        return $("body").trigger('vkinited');
      });
    }
    if (window.social == null) {
      window.social = {};
    }
    window.social.auth = {};
    Facebook = (function() {
      function Facebook() {}

      Facebook.prototype.signIn = function(callback, fallback) {
        return FB.getLoginStatus(function(response) {
          if (response.status === "not_authorized" || response.status === "unknown") {
            return FB.login(function(authResponse) {
              if (authResponse.status === "connected") {
                return callback(authResponse);
              } else {
                return fallback(authResponse);
              }
            });
          } else if (response.status === "connected") {
            return callback(response);
          } else {
            return fallback(response);
          }
        });
      };

      Facebook.prototype.signOut = function(callback, fallback) {};

      return Facebook;

    })();
    Vkontakte = (function() {
      function Vkontakte() {}

      Vkontakte.prototype.signIn = function(callback, fallback) {
        return VK.Auth.getLoginStatus(function(response) {
          var channel, url;
          if (response.session) {
            return callback(response);
          } else {
            VK.Auth.login(function(authResponse) {
              if (authResponse.session) {
                return callback(authResponse);
              } else {
                return fallback(authResponse);
              }
            }, 1 + 8192);
            channel = window.location.protocol + '//' + window.location.hostname + "/channel";
            channel = 'close.html';
            url = VK._domain.main + VK._path.login + '?client_id=' + VK._apiId + '&display=popup&redirect_uri=' + channel + '&response_type=token&scope=' + (1 + 8192);
            return VK.UI.popup({
              width: 620,
              height: 370,
              url: url
            });
          }
        });
      };

      Vkontakte.prototype.signOut = function(callback, fallback) {};

      return Vkontakte;

    })();
    SocialShare = (function() {
      function SocialShare() {}

      SocialShare.prototype.Vkontakte = function(data) {
        var shareUrl;
        if (data.share.url == null) {
          data.share.url = window.location.href;
        }
        shareUrl = 'http://vkontakte.ru/share.php?';
        shareUrl += 'url=' + encodeURIComponent(data.share.url);
        shareUrl += '&title=' + encodeURIComponent(data.share.title);
        shareUrl += '&description=' + encodeURIComponent(data.share.description);
        shareUrl += '&image=' + encodeURIComponent(data.share.image);
        shareUrl += '&noparse=true';
        return window.open(shareUrl, 'Share', 'toolbar=0,status=0,width=626,height=536');
      };

      SocialShare.prototype.Facebook = function(data) {
        if (data.share.url == null) {
          data.share.url = window.location.href;
        }
        return FB.ui({
          method: 'feed',
          link: data.share.url,
          name: data.share.title,
          description: data.share.description,
          picture: data.share.image
        });
      };

      SocialShare.prototype.Pinterest = function(data) {
        var shareUrl;
        if (data.share.url == null) {
          data.share.url = window.location.href;
        }
        shareUrl = 'http://www.pinterest.com/pin/create/button/?';
        shareUrl += 'url=' + encodeURIComponent(data.share.url);
        shareUrl += '&media=' + encodeURIComponent(data.share.image);
        shareUrl += '&description=' + encodeURIComponent(data.share.title + "\n" + data.share.description);
        return window.open(shareUrl, 'Share', 'toolbar=0,status=0,width=626,height=536');
      };

      SocialShare.prototype.Twitter = function(data) {
        var shareUrl;
        if (data.share.url == null) {
          data.share.url = window.location.href;
        }
        shareUrl = 'http://twitter.com/share?';
        shareUrl += 'text=' + encodeURIComponent(data.share.title + "\n" + data.share.description);
        shareUrl += '&url=' + encodeURIComponent(data.share.url);
        shareUrl += '&counturl=' + encodeURIComponent(data.share.url);
        return window.open(shareUrl, 'Share', 'toolbar=0,status=0,width=626,height=536');
      };

      return SocialShare;

    })();
    Invite = (function() {
      function Invite() {}

      Invite.prototype.Do = function(callback) {
        if (fvSite.config.get("user.subclass") === "User_Vk") {
          return this.Vkontakte(function(id) {
            return $.ajax({
              url: "/invite/vkontakte",
              data: {
                id: id
              },
              dataType: "json",
              success: function(data) {
                if (callback != null) {
                  return callback();
                }
              }
            });
          });
        }
        if (fvSite.config.get("user.subclass") === "User_FB") {
          return this.Facebook(function(data) {
            return $.ajax({
              url: "/invite/facebook",
              data: data,
              dataType: "json",
              success: function(data) {
                if (callback != null) {
                  return callback();
                }
              }
            });
          });
        }
        throw "Not social user";
      };

      Invite.prototype.Vkontakte = function(callback) {
        return $.ajax({
          url: "/invite/render",
          dataType: "json",
          success: function(data) {
            var $popup, close;
            if (data.success) {
              $popup = $(data.html);
              $popup.appendTo("body").hide().fadeIn();
              $popup.find(".invite-clear-search").click(function() {
                $popup.find(".invite-search-haystack>*").show();
                $popup.find(".invite-search-needle").val('');
                return false;
              });
              $popup.find(".invite-search-needle").keydown(function() {
                var filter;
                filter = function(needle) {
                  $popup.find(".invite-search-haystack>*").each(function() {
                    var $link, regEx;
                    regEx = needle ? new RegExp(".*" + needle + ".*", "ig") : /.*/;
                    $link = $(this);
                    if (regEx.test($link.data("name"))) {
                      return $link.show();
                    }
                    return $link.hide();
                  });
                  return $popup.trigger('change');
                };
                return setTimeout(((function(_this) {
                  return function() {
                    return filter($(_this).val());
                  };
                })(this)), 1);
              });
              $popup.find(".invite-user").on("click", function() {
                var $this;
                $this = $(this);
                VK.api("wall.post", {
                  owner_id: $this.data("id"),
                  message: fvSite.dictionary.get("inviteTitle") + "\n" + fvSite.dictionary.get("inviteText"),
                  attachments: ("http://" + document.location.host + "?req=") + fvSite.config.get('user.id')
                }, function() {
                  return callback($this.data("id"));
                });
                return false;
              });
              close = function() {
                return $popup.fadeOut(function() {
                  return $popup.remove();
                });
              };
              return $popup.find(".invite-close").on("click", close);
            }
          }
        });
      };

      Invite.prototype.Facebook = function(callback) {
        return FB.ui({
          method: "apprequests",
          title: fvSite.dictionary.get("inviteTitle"),
          message: fvSite.dictionary.get("inviteText")
        }, function(response) {
          return callback(response);
        });
      };

      return Invite;

    })();
    window.social.auth.facebook = new Facebook;
    window.social.auth.vkontakte = new Vkontakte;
    window.social.share = new SocialShare;
    return window.social.invite = new Invite;
  });

}).call(this);
