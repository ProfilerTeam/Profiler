<?php

class CronController extends Controller
{

    const MODE_HOURLY = 'hourly';
    const MODE_DAILY = 'daily';

    protected function beforeAction($action)
    {
        return parent::beforeAction($action);
    }

    public function actionHourly()
    {
        print "<pre>";
        print $this->runCron(self::MODE_HOURLY);
        echo "</pre>";
    }

    public function actionDaily()
    {
        echo "<pre>";
        echo $this->runCron(self::MODE_DAILY);
        echo "</pre>";
    }

    private function runCron($mode = self::MODE_HOURLY)
    {
        $runner = new CConsoleCommandRunner();
        $runner->commands = array(
            'cron' => 'application.commands.shell.ZCron.ZCronRunner'
        );

        ob_start();
        $runner->run(array('yiic', 'cron', $mode));
        return ob_get_clean();
    }

}
