<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HClientScript extends the CClientScript
 *
 * @package profiler.components
 * @since 0.5
 */
class HClientScript extends CClientScript
{

    /**
     * @var array the registered HTML code blocks (key => code)
     */
    public $htmls = array();

    /**
     * Method to inject a javascript variable
     *
     * @param String $name
     * @param String $value
     */
    public function setJavascriptVariable($name, $value)
    {

        $jsCode = "var " . $name . " = '" . $value . "';\n";
        $this->registerScript('jsVar_' . $name, $jsCode, CClientScript::POS_BEGIN);
    }

    /**
     * Registers a piece of html code.
     * @param string $id ID that uniquely identifies this piece of HTML code
     * @param string $html the html code
     *
     * @return CClientScript the CClientScript object itself (to support method chaining, available since version 1.1.5).
     */
    public function registerHtml($id, $html)
    {

        $this->hasScripts = true;

        $this->htmls[$id] = $html;

        $params = func_get_args();
        $this->recordCachingAction('clientScript', 'registerScript', $params);
        return $this;
    }

    /**
     * Inserts the scripts and other html snippets at the end of the body section.
     *
     * @param string $output the output to be inserted with scripts.
     */
    public function renderBodyEnd(&$output)
    {
        if (!isset($this->scriptFiles[self::POS_END]) && !isset($this->scripts[self::POS_END]) && !isset($this->scripts[self::POS_READY]) && !isset($this->scripts[self::POS_LOAD]) && !count($this->htmls) == 0)
            return;

        $fullPage = 0;
        $output = preg_replace('/(<\\/body\s*>)/is', '<###end###>$1', $output, 1, $fullPage);
        $html = '';
        if (isset($this->scriptFiles[self::POS_END])) {
            foreach ($this->scriptFiles[self::POS_END] as $scriptFile)
                $html.=CHtml::scriptFile($scriptFile) . "\n";
        }


        //----------------------------------------------------------------------------------------------------
        // Begin Custom
        foreach ($this->htmls as $id => $htmlSnippet) {
            $html .= $htmlSnippet;
        }
        //----------------------------------------------------------------------------------------------------

        $scripts = isset($this->scripts[self::POS_END]) ? $this->scripts[self::POS_END] : array();
        if (isset($this->scripts[self::POS_READY])) {
            if ($fullPage)
                $scripts[] = "jQuery(function($) {\n" . implode("\n", $this->scripts[self::POS_READY]) . "\n});";
            else
                $scripts[] = implode("\n", $this->scripts[self::POS_READY]);
        }
        if (isset($this->scripts[self::POS_LOAD])) {
            if ($fullPage)
                $scripts[] = "jQuery(window).on('load',function() {\n" . implode("\n", $this->scripts[self::POS_LOAD]) . "\n});";
            else
                $scripts[] = implode("\n", $this->scripts[self::POS_LOAD]);
        }
        if (!empty($scripts))
            $html.=CHtml::script(implode("\n", $scripts)) . "\n";

        if ($fullPage)
            $output = str_replace('<###end###>', $html, $output);
        else
            $output = $output . $html;
    }

}

?>
