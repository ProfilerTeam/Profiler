<div class="panel panel-default panel-activities">

    <div class="panel-heading"><?php echo Yii::t('ActivityModule.widgets_views_statusStream', '<strong>Profiler</strong> status'); ?></div>
    <div id="activityStream">
                <center>
                                <br>
                                <br>
                                <img src="http://Profiler.cf/loginLogo.png">
                                <br>
                                <span class="label label-success"><strong><?php echo Yii::app()->params['versionFlag']; ?> (Version <?php echo Yii::app()->params['version']; ?>)</strong></span>
                                <br>
                                <h4 style="text-align: center; color: #262626; padding-left: 40px; padding-right: 40px;">Profiler is going good, so far we're fixing all the bugs we come across quickly and efficiently. We'll keep you posted on the status (if any bad things happen) in this panel here.</h4>
                                <br>
                                <br>
                                <br>
                </center>
                </div>
    </div>
</div>

<style>
.db-pricing-seven {
    margin-bottom: 30px;
    margin-top: 30px;
    text-align: center;
    border: 1px solid #C5C2C2;
    background-color: #EDEDED;
}

    .db-pricing-seven:hover {
        margin-top: 5px;
        -moz-transition: margin-top 0.25s ease 0s;
        -ms-transition: margin-top 0.25s ease 0s;
        transition: margin-top 0.25s ease 0s;
    }

    .db-pricing-seven ul {
        list-style: none;
        margin: 0;
        text-align: center;
        padding-left: 0px;
    }

        .db-pricing-seven ul li {
            border-bottom: solid 1px #D8D8D8;
            padding-top: 20px;
            padding-bottom: 20px;
            cursor: pointer;
            text-transform: uppercase;
        }

            .db-pricing-seven ul li.price {
                background-color: #fff;
                padding: 40px 20px 20px 20px;
                font-size: 20px;
                font-weight: 900;
                color: #353c3e;
                font-weight: 900;
            }

                .db-pricing-seven ul li.price i {
                    padding: 30px;
                    font-size: 50px;
                    display: block;
                }


    .db-pricing-seven .pricing-footer {
        padding: 20px;
    }

        .db-pricing-seven .pricing-footer a i {
            margin: 5px;
            top: 3px;
        }
</style>

<script type="text/javascript">

    // set niceScroll to activity list
    $("#activityContents").niceScroll({
        cursorwidth: "7",
        cursorborder:"",
        cursorcolor:"#555",
        cursoropacitymax:"0.2",
        railpadding:{top:0,right:3,left:0,bottom:0}
    });

    // update nicescroll object with new content height after ajax request
    $(document).ajaxComplete(function(event, xhr, settings) {
        $("#activityContents").getNiceScroll().resize();
    })

</script>


