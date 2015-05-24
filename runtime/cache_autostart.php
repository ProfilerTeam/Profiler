<?php

Yii::app()->moduleManager->register(array(
    'id' => 'activity',
    'class' => 'application.modules_core.activity.ActivityModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.activity.*',
        'application.modules_core.activity.models.*',
        'application.modules_core.activity.widgets.*',
    ),
    // Events to Catch
    'events' => array(
        array('class' => 'User', 'event' => 'onAfterDelete', 'callback' => array('ActivityModule', 'onUserDelete')),
        array('class' => 'Space', 'event' => 'onBeforeDelete', 'callback' => array('ActivityModule', 'onSpaceDelete')),
        array('class' => 'HActiveRecord', 'event' => 'onBeforeDelete', 'callback' => array('ActivityModule', 'onActiveRecordDelete')),
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('ActivityModule', 'onIntegrityCheck')),
       ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'admin',
    'class' => 'application.modules_core.admin.AdminModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.admin.*',
    ),
    'events' => array(
        array('class' => 'DashboardSidebarWidget', 'event' => 'onInit', 'callback' => array('AdminModule', 'onDashboardSidebarInit')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'comment',
    'class' => 'application.modules_core.comment.CommentModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.comment.*',
        'application.modules_core.comment.models.*',
        'application.modules_core.comment.notifications.*',
    ),
    // Events to Catch
    'events' => array(
        array('class' => 'User', 'event' => 'onBeforeDelete', 'callback' => array('CommentModule', 'onUserDelete')),
        array('class' => 'HActiveRecordContent', 'event' => 'onBeforeDelete', 'callback' => array('CommentModule', 'onContentDelete')),
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('CommentModule', 'onIntegrityCheck')),
        array('class' => 'WallEntryLinksWidget', 'event' => 'onInit', 'callback' => array('CommentModule', 'onWallEntryLinksInit')),
        array('class' => 'WallEntryAddonWidget', 'event' => 'onInit', 'callback' => array('CommentModule', 'onWallEntryAddonInit')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'dashboard',
    'class' => 'application.modules_core.dashboard.DashboardModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.dashboard.*',
    ),
    // Events to Catch 
    'events' => array(
        array('class' => 'TopMenuWidget', 'event' => 'onInit', 'callback' => array('DashboardModule', 'onTopMenuInit')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'directory',
    'class' => 'application.modules_core.directory.DirectoryModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.directory.*',
    ),
    // Events to Catch 
    'events' => array(
        array('class' => 'TopMenuWidget', 'event' => 'onInit', 'callback' => array('DirectoryModule', 'onTopMenuInit')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'file',
    'class' => 'application.modules_core.file.FileModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.file.*',
        'application.modules_core.file.models.*',
        'application.modules_core.file.libs.*',
    ),
    // Events to Catch 
    'events' => array(
        array('class' => 'WallEntryAddonWidget', 'event' => 'onInit', 'callback' => array('FileModuleEvents', 'onWallEntryAddonInit')),
        array('class' => 'ZCronRunner', 'event' => 'onDailyRun', 'callback' => array('FileModuleEvents', 'onCronDailyRun')),
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('FileModuleEvents', 'onIntegrityCheck')),
        array('class' => 'HActiveRecord', 'event' => 'onBeforeDelete', 'callback' => array('FileModuleEvents', 'onBeforeHActiveRecordDelete')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'hostinginfo',
    'class' => 'application.modules_core.hostinginfo.HostinginfoModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.hostinginfo.*',
    ),
    // Events to Catch 
    'events' => array(
        array('class' => 'AdminMenuWidget', 'event' => 'onInit', 'callback' => array('HostinginfoModule', 'onAdminMenuInit')),
        array('class' => 'AuthController', 'event' => 'onBeforeAction', 'callback' => array('HostinginfoModule', 'onBeforeAuthControllerAction')),
        array('class' => 'UserController', 'event' => 'onBeforeAction', 'callback' => array('HostinginfoModule', 'onBeforeAdminUserControllerAction')),
    ),
));
?><?php

// Only activate installer mode, when not installed yet
if (!Yii::app()->params['installed']) {
    Yii::app()->moduleManager->register(array(
        'id' => 'installer',
        'class' => 'application.modules_core.installer.InstallerModule',
        'isCoreModule' => true,
    ));
}
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'like',
    'class' => 'application.modules_core.like.LikeModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.like.*',
        'application.modules_core.like.models.*',
        'application.modules_core.like.notifications.*',
    ),
    // Events to Catch
    'events' => array(
        array('class' => 'User', 'event' => 'onBeforeDelete', 'callback' => array('LikeModule', 'onUserDelete')),
        array('class' => 'HActiveRecordContent', 'event' => 'onBeforeDelete', 'callback' => array('LikeModule', 'onContentDelete')),
        array('class' => 'HActiveRecordContentAddon', 'event' => 'onBeforeDelete', 'callback' => array('LikeModule', 'onContentAddonDelete')),
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('LikeModule', 'onIntegrityCheck')),
        array('class' => 'WallEntryLinksWidget', 'event' => 'onInit', 'callback' => array('LikeModule', 'onWallEntryLinksInit')),
        array('class' => 'WallEntryAddonWidget', 'event' => 'onInit', 'callback' => array('LikeModule', 'onWallEntryAddonInit')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'notification',
    'class' => 'application.modules_core.notification.NotificationModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.notification.*',
        'application.modules_core.notification.models.*',
    ),
    // Events to Catch 
    'events' => array(
        array('class' => 'User', 'event' => 'onBeforeDelete', 'callback' => array('NotificationModule', 'onUserDelete')),
        array('class' => 'Space', 'event' => 'onBeforeDelete', 'callback' => array('NotificationModule', 'onSpaceDelete')),
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('NotificationModule', 'onIntegrityCheck')),
        array('class' => 'ZCronRunner', 'event' => 'onDailyRun', 'callback' => array('NotificationModule', 'onCronDailyRun')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'post',
    'class' => 'application.modules_core.post.PostModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.post.*',
        'application.modules_core.post.models.*',
    ),
    // Events to Catch
    'events' => array(
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('PostModule', 'onIntegrityCheck')),
        array('class' => 'HSearch', 'event' => 'onRebuild', 'callback' => array('PostModule', 'onSearchRebuild')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'space',
    'class' => 'application.modules_core.space.SpaceModule',
    'import' => array(
        'application.modules_core.space.behaviors.*',
        'application.modules_core.space.widgets.*',
        'application.modules_core.space.models.*',
        'application.modules_core.space.notifications.*',
        'application.modules_core.space.*',
    ),
    'isCoreModule' => true,

    // Events to Catch
    'events' => array(
        array('class' => 'User', 'event' => 'onBeforeDelete', 'callback' => array('SpaceModule', 'onUserDelete')),
        array('class' => 'HSearch', 'event' => 'onRebuild', 'callback' => array('SpaceModule', 'onSearchRebuild')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'tour',
    'class' => 'application.modules_core.tour.TourModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.tour.*',
    ),
    // Events to Catch
    'events' => array(
        array('class' => 'DashboardSidebarWidget', 'event' => 'onInit', 'callback' => array('TourModule', 'onDashboardSidebarInit')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'user',
    'class' => 'application.modules_core.user.UserModule',
    'isCoreModule' => true,
    'import' => array(
        'application.modules_core.user.components.*',
        'application.modules_core.user.models.*',
        'application.modules_core.user.widgets.*',
        'application.modules_core.user.notifications.*',
        'application.modules_core.user.forms.*',
        'application.modules_core.user.*',
    ),
    // Events to Catch
    'events' => array(
        array('class' => 'HSearch', 'event' => 'onRebuild', 'callback' => array('UserModule', 'onSearchRebuild')),
    ),
));
?><?php

Yii::app()->moduleManager->register(array(
    'id' => 'wall',
    'class' => 'application.modules_core.wall.WallModule',
    'import' => array(
        'application.modules_core.wall.*',
        'application.modules_core.wall.models.*',
        'application.modules_core.wall.widgets.*',
        'application.modules_core.wall.notifications.*',
    ),
    'isCoreModule' => true,
    // Events to Catch 
    'events' => array(
        array('class' => 'IntegrityChecker', 'event' => 'onRun', 'callback' => array('WallModule', 'onIntegrityCheck')),
        array('class' => 'WallEntryControlsWidget', 'event' => 'onInit', 'callback' => array('WallModule', 'onWallEntryControlsInit')),
        array('class' => 'WallEntryAddonWidget', 'event' => 'onInit', 'callback' => array('WallModule', 'onWallEntryAddonInit')),
    ),
));
?>