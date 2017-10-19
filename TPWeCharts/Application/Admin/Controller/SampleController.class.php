<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;


/**
 * �������ɶ�ά��
 */
class SampleController extends AdminBaseController{
	
	/**
	 * �������ɶ�ά��
	 */
	public function QRCode(){
		// ..
		$this->display();
	}
	/**
	 * ��������pdf
	 */
	public function Pdf(){
		//
		$this->display();
	}
	/**
	 * ��������Excel
	 */
	public function Excel(){
		//
		$this->display();
	}
	/**
     * ���ɶ�ά��
     */
    public function c_qrcode(){
        $url=I('post.url');
		$level=3;  
        $size=4;  
        Vendor('phpqrcode.phpqrcode');  
        $errorCorrectionLevel =intval($level) ;//�ݴ���  
        $matrixPointSize = intval($size);//����ͼƬ��С  
        //���ɶ�ά��ͼƬ  
        $object = new \QRcode();
        $object->png($url, false, $errorCorrectionLevel, $matrixPointSize, 2); 
        //qrcode($url);
		return $object;
    }

    /**
     * ����pdf
     */
    public function c_pdf(){
        $content=$_POST['content'];
        pdf($content);
    }
	/**
     * ����xls��ʽ�ı��
     */
    public function xls(){
        $data=I('post.data');
        create_xls($data);
    }

    /**
     * ����csv��ʽ�ı��
     */
    public function csv(){
        $data=I('post.data');
        array_walk($data, function(&$v){
            $v=implode(',', $v);
        });
        create_csv($data);
    }

    /**
     * ����xls��ʽ������ 
     * Ҳ������������csv��ʽ������
     * ����csv����ʹ�� �����import_csv Ч�ʸ���
     */
    public function import_xls(){
        $data=import_excel('./Upload/excel/simple.xls');
        p($data);
    }

    /**
     * ����csv��ʽ������
     */
    public function import_csv(){
        $data=file_get_contents('./Upload/excel/simple.csv');
        $data=explode("\r\n", $data);
        p($data);
    }
}
