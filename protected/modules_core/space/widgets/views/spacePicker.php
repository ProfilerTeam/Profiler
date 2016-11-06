<?php

// Resolve guids to space tags
$newValue = "";

foreach (explode(",", $currentValue) as $guid) {
    $space = Space::model()->findByAttributes(array('guid' => trim($guid)));
    if ($space != null) {
        $imageUrl = $space->getProfileImage()->getUrl();
        $name = CHtml::encode($space->name);
        $newValue .= '<li class="spaceInput" id="' . $space->guid . '"><img class="img-rounded" alt="24x24" data-src="holder.js/24x24" style="width: 24px; height: 24px;" src="' . $imageUrl . '" alt="' . $name . 'r" width="24" height="24">' . addslashes($name) . '<i class="fa fa-times-circle"></i></li>';

    }
}
?>


<script type="text/javascript">

    $('#<?php echo $inputId; ?>').spacepicker({
        inputId: '#<?php echo $inputId; ?>',
        maxSpaces: '<?php echo $maxSpaces; ?>',
        searchUrl: '<?php echo $spaceSearchUrl; ?>',
        currentValue: '<?php echo $newValue; ?>'
    });

</script>