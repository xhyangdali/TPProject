<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;


/**
 * 案例生成二维码
 */
class SampleController extends AdminBaseController{
	
	/**
	 * 案例生成二维码
	 */
	public function QRCode(){
		// ..
		$this->display();
	}
	/**
	 * 案例生成pdf
	 */
	public function Pdf(){
		//
		$this->display();
	}
	/**
	 * 案例生成Excel
	 */
	public function Excel(){
		//
		$this->display();
	}
	/**
     * 生成二维码
     */
    public function c_qrcode(){
        $url=I('post.url');
		$level=3;  
        $size=4;  
        Vendor('phpqrcode.phpqrcode');  
        $errorCorrectionLevel =intval($level) ;//容错级别  
        $matrixPointSize = intval($size);//生成图片大小  
        //生成二维码图片  
        $object = new \QRcode();
        $object->png($url, false, $errorCorrectionLevel, $matrixPointSize, 2); 
        //qrcode($url);
		return $object;
    }

    /**
     * 生成pdf
     */
    public function c_pdf(){
        $content=$_POST['content'];
        pdf($content);
    }
	/**
     * 生成xls格式的表格
     */
    public function xls(){
        $data=I('post.data');
        create_xls($data);
    }

    /**
     * 生成csv格式的表格
     */
    public function csv(){
        $data=I('post.data');
        array_walk($data, function(&$v){
            $v=implode(',', $v);
        });
        create_csv($data);
    }

    /**
     * 导入xls格式的数据 
     * 也可以用来导入csv格式的数据
     * 但是csv建议使用 下面的import_csv 效率更高
     */
    public function import_xls(){
        $data=import_excel('./Upload/excel/simple.xls');
        p($data);
    }

    /**
     * 导入csv格式的数据
     */
    public function import_csv(){
        $data=file_get_contents('./Upload/excel/simple.csv');
        $data=explode("\r\n", $data);
        p($data);
    }
}
