<?php
// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\api\controller;

use app\common\controller\ControllerBase;

/**
 * 接口基类控制器
 */
class ApiBase extends ControllerBase
{
    
    /**
     * 基类初始化
     */
    public function __construct()
    {
        
        parent::__construct();
        
        $this->logicApiBase->checkParam($this->param);
        
        debug('api_begin');
    }
    
    /**
     * API返回数据
     */
    public function apiReturn($code_data = [], $return_data = [], $return_type = 'json')
    {
        
        $result = $this->logicApiBase->apiReturn($code_data, $return_data, $return_type);
        
        debug('api_end');
        
        write_exe_log('api_begin', 'api_end', DATA_NORMAL);
        
        return $result;
    }
}
