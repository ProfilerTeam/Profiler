<?php
class UserSearchResultWidget extends HWidget {

    /**
     * The user object
     *
     * @var User
     */
    public $user;

    /**
     * Executes the widget.
     */
    public function run() {

        $this->render('searchResult', array(
            'user' => $this->user,
        ));
    }

}

?>
