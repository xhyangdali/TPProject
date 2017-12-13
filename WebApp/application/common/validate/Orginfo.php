<?php
namespace app\common\validate;

use think\Validate;

class Orginfo extends Validate
{
    protected $rule = [
        "name|机构名称" => "require",
        "orgcode|组织机构编码" => "require",
    ];
}
