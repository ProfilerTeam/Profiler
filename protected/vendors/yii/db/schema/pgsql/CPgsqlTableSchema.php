<?php
/**
 * CPgsqlTable class file.
 *
 * @author Zak
 * @link http://www.yiiframework.com/
 * @copyright 2008-2013 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

/**
 * CPgsqlTable represents the metadata for a PostgreSQL table.
 *
 * @author Zak
 * @package system.db.schema.pgsql
 * @since 1.0
 */
class CPgsqlTableSchema extends CDbTableSchema
{
	/**
	 * @var string name of the schema that this table belongs to.
	 */
	public $schemaName;
}
