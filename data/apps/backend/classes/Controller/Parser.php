<?php
/**
 * User: Eternal1
 * Date: 8/28/2015
 * Time: 4:12 PM
 */

class Controller_Parser extends fvController
{

    protected function init()
    {
        /** @var Admin $admin */
        $admin = fvSite::session()->getAdmin();

        if( ! $admin->hasAcl( fvSite::app()->getRouter()->getUriParam( 'module' ) ) ){
            throw new Error_PermissionDenied;
        }
    }

    /**
     * @route /parser
     */
    function indexAction()
    {
        $this->view()->directions = Direction::findAll();
        $this->getLayout()->addJS('/theme/backend/parser.js');
    }

    /**
     * @route /parser/process
     */
    function processAction()
    {
        $this->useLayout(false);

        $file = $_FILES['file'];
        $directionId = $this->getRequest()->getRequestParameter('directionId');

        $reader = PHPExcel_IOFactory::createReader(\PHPExcel_IOFactory::identify($file['tmp_name']));

        if (method_exists($reader, "setReadDataOnly")) {
            $reader->setReadDataOnly(true);
        }
        /** @var PHPExcel $excel */
        $excel = $reader->load($file['tmp_name']);

        $sheet = $excel->getSheet();
        $end = false;
        $row = 1;
        $price = new Price;
        $response = [];
        do {
            //Получаем значение первой ячейки ряда
            $id = trim($sheet->getCell("A{$row}")->getValue());

            if ($id) {

                //Если это текст - обрабатываем категорию
                if (!is_numeric($id)) {
                    $responseRow['direction'] = $id;
                    $responseRow['name'] = '';
                    $responseRow['price'] = '';
                    $responseRow['status'] = 'Найдена';
                    $data = ['root_lang.name' => $id, 'directionId' => $directionId];
                    $price = Price::find($data);


                    if (!$price instanceof Price) {
                        $data['name'] = $id;
                        unset($data['root_lang.name']);
                        $price = new Price();
                        $price->setLanguage('ru');
                        $price->hydrate($data);
                        $price->save();
                        $responseRow['status'] = 'Создана';
                    }
                } else { //Если цифра - услугу
                    $data = ['root_lang.name' => $sheet->getCell("B{$row}")->getValue(), 'priceId' => $price->getPk()];
                    $info = PriceInfo::find($data);

                    $responseRow['direction'] = $price->name->get();
                    $responseRow['name'] = $data['root_lang.name'];
                    $responseRow['price'] = $sheet->getCell("C{$row}")->getValue();
                    $responseRow['status'] = 'Обновлена';

                    if (!$info instanceof PriceInfo) {
                        $data['name'] = $data['root_lang.name'];
                        unset($data['root_lang.name']);
                        $responseRow['status'] = 'Создана';
                        $info = new PriceInfo();
                        $info->setLanguage('ru');
                        $info->hydrate($data);
                    }

                    $info->priceInt = $sheet->getCell("C{$row}")->getValue();
                    $info->save();
                }

                $response[] = $responseRow;
                $row++;
            } else {
                $end = true;
            }
        } while (!$end);

        return json_encode($response);
    }

}