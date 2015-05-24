<?php
/**
 * CMssqlTableSchema class file.
 *
 * @author Zak
 * @author Zak
 * @link http://www.yiiframework.com/
 * @copyright 2008-2013 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

/**
 * CMssqlTableSchema represents the metadata for a MSSQL table.
 *
 * @author Zak
 * @author Zak
 * @package system.db.schema.mssql
 */
class CMssqlTableSchema extends CDbTableSchema
{
	/**
	 * @var string name of the catalog (database) that this table belongs to.
	 * Defaults to null, meaning no schema (or the current database).
	 */
	public $catalogName;
	/**
	 * @var string name of the schema that this table belongs to.
	 * Defaults to null, meaning no schema (or the current database owner).
	 */
	public $schemaName;
}
