<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * The TestMail command is used to test the e-mail subsystem.
 *
 * @package profiler.commands.shell.EMailing
 * @since 0.5
 */
class TestMail extends HConsoleCommand {

    public function run($args) {
        print " E-Mail - Test Interface\n";
        print "-------------------------------------------------------------------------\n\n";

        if (!isset($args[0]) || ($args[0] == "")) {
            print "\n Run with parameter [email]!\n";
            print "\n\n";
            exit;
        }
        $email = $args[0];

        $user = User::model()->findByPk(1);

        $message = new HMailMessage();
        $message->view = 'application.views.mail.EMailing';
        $message->addFrom(HSetting::Get('systemEmailAddress', 'mailing'), HSetting::Get('systemEmailName', 'mailing'));
        $message->addTo($email);
        $message->subject = "Test Mail";

        $message->setBody(array('user' => $user), 'text/html');
        Yii::app()->mail->send($message);

        print "Sent! \n";

        print "\nEMailing completed.\n";
    }

}
