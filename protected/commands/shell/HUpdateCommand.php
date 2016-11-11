<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * UpdateCommand should be executed after replacing Profiler Source files.
 * It basically runs migrations and may do further checks (module compatiblity)
 * in future.
 * 
 * @author Zak
 */
class HUpdateCommand extends HConsoleCommand
{

    /**
     * Interactive mode
     * 
     * @var boolean
     */
    protected $interactive;

    /**
     * Got errors during update
     * 
     * @var boolean
     */
    protected $hasErrors = false;

    public function init()
    {
        $this->printHeader('Updater');
        return parent::init();
    }

    public function actionIndex($args, $interactive = 1)
    {
        $this->interactive = $interactive;

        print "*** Begin Migrations ***\n\n";
        $this->runMigrations();
        $this->printLine();

        print "\n*** Checking Modules ***\n\n";
        $this->runModuleCheck();

        print "\n\n\n";
        $this->printLine();
        if (!$this->hasErrors) {
            print "Finished succesfully without errors!";
        } else {
            print "Finished with ERRORS!";
        }
        $this->printLine();
        print "\n";
    }

    /**
     * Runs migration command
     */
    protected function runMigrations()
    {

        $runner = new CConsoleCommandRunner();

        $runner->commands = array(
            'migrate' => array(
                'class' => 'application.commands.shell.ZMigrateCommand',
            ),
        );
        $args = array('yiic', 'migrate', '--interactive=' . $this->interactive);
        $runner->run($args);
    }

    /**
     * Checks if installed module compatiblity / try load them.
     */
    protected function runModuleCheck()
    {
        // TODO
    }

    /**
     * Shows confirmation dialog
     * 
     * @param String $message
     * @param String $default
     * @return boolean
     */
    public function confirm($message, $default = false)
    {
        if (!$this->interactive)
            return true;
        return parent::confirm($message, $default);
    }

    
    /**
     * Shows help message
     * 
     * @return String
     */
    public function getHelp()
    {
        return <<<EOD
USAGE
  yiic update [--interactive=0]

DESCRIPTION
  Run this command after updating Profiler Core files.

EXAMPLES
 * yiic update

EOD;
    }

}
