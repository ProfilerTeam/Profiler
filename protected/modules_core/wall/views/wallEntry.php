<?php
/**
 * WallEntry used in a stream and the activity stream.
 *
 * @property Mixed $object a content object like Post
 * @property WallEntry $entry the wall entry to display
 * @property String $content the output of the content object (wallOut)
 *
 * @package profiler.modules_core.wall
 * @since 0.5
 */
?>
<div class="hashtaggable">
<?php if ($mode != "activity") : ?>
    <div class="wall-entry" id="linkify wallEntry_<?php echo $entry->id; ?>">
<?php endif; ?>

    <?php echo $content; ?>

<?php if ($mode != "activity") : ?>
    </div>
    <script type="text/javascript">
        // Replace the standard checkbox and radio buttons
        $('#wallEntry_<?php echo $entry->id; ?>').find(':checkbox, :radio').flatelements();
    </script>
<?php endif; ?>
</div>