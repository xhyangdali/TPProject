<?php
namespace Statistics\Controller;
use Common\Controller\StatisticsBaseController;
/**
 * 查询统计 首页Controller
 */
class IndexController extends StatisticsBaseController{
	/**
	 * 查询统计页面
	 */
	public function Index(){
        $this->display();
	}

	/**
	 * 查询统计对比页面
	 */
	public function Contrast(){
		$this->display();
	}
	/**
	 * 查询统计（搜索页面）
	 */
	public function Search(){
		$this->display();
	}
}

