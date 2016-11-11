<?php
/**
 * CSafeValidator class file.
 *
 * @author Zak
 * @link http://www.yiiframework.com/
 * @copyright 2008-2013 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

/**
 * CSafeValidator marks the associated attributes to be safe for massive assignments.
 *
 * @author Zak
 * @package system.validators
 * @since 1.1
 */
class CSafeValidator extends CValidator
{
	/**
	 * Validates the attribute of the object.
	 * If there is any error, the error message is added to the object.
	 * @param CModel $object the object being validated
	 * @param string $attribute the attribute being validated
	 */
	protected function validateAttribute($object,$attribute)
	{
	}
}

