<?php

/**
 * Profiler
 *  © 2015 Profiler
 *
 * 
 * 
 * 
 *
 * 
 * 
 * 
 *
 * 
 * 
 * 
 * 
 */

/**
 * Console tools for manage spaces
 *
 * @package profiler.modules_core.space.console
 * @since 0.5
 */
class SpaceCliTool extends HConsoleCommand
{

    public function init()
    {
        $this->printHeader('Space Tools');
        return parent::init();
    }

    public function beforeAction($action, $params)
    {

        return parent::beforeAction($action, $params);
    }

    public function actionAssignAllMembers($args)
    {

        if (!isset($args[0])) {
            print "Error: Space guid parameter required!\n\n";
            print $this->getHelp();
            return;
        }

        $space = Space::model()->findByAttributes(array('guid' => $args[0]));
        if ($space == null) {
            print "Error: Space not found! Check guid!\n\n";
            return;
        }

        $countMembers = 0;
        $countAssigns = 0;

        foreach (User::model()->findAllByAttributes(array('status' => User::STATUS_ENABLED)) as $user) {


            if ($space->isMember($user->id)) {
                #print "Already Member!";
                $countMembers++;
            } else {
                print "Add member " . $user->displayName . "\n";
                Yii::app()->user->setId($user->id);
                $space->addMember($user->id);
                $countAssigns++;
            }
        }

        print "\nAdded " . $countAssigns . " new members to space " . $space->name . "\n";
    }

    public function getHelp()
    {
        return <<<EOD
USAGE
  yiic space [action] [parameter]

DESCRIPTION
  This command provides console support for manipulating spaces. 

EXAMPLES
 * yiic space assignAllMembers spaceGuid
   Assign all members to given spaceGuid

EOD;
    }

}
