/**
 * <p>Original Author: toddanderson</p>
 * <p>Class File: CouchModel.as</p>
 * <p>Version: 0.5</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 */
package com.custardbelly.as3couchdb.core
{
	import com.custardbelly.as3couchdb.mediator.IServiceMediator;
	
	import flash.events.EventDispatcher;
	
	/**
	 * CouchModel is a base model class for databases and documents and handles resolving the identity related to the annotated metadata for this instance. 
	 * @author toddanderson
	 */
	public class CouchModel extends EventDispatcher
	{
		protected var _entity:CouchModelEntity;
		protected var _mediator:IServiceMediator;
		protected var _isDeleted:Boolean;
		
		/**
		 * Constructor. Resolves entity for this instance based on metadata.
		 */
		public function CouchModel()
		{
			_entity = CouchModelEntity.parse( this );
			_mediator = _entity.mediator;
		}
				
		/**
		 * Returns the name of the target database described in the parsed entity. 
		 * @return String
		 */
		public function get databaseName():String
		{
			return _entity.databaseName;
		}
		
		/**
		 * Returns the base url of the CouchDB instance described in the parsed entity. 
		 * @return String
		 */
		public function get baseUrl():String
		{
			return _entity.baseUrl;
		}
		
		/**
		 * Returns flag of instance having been deleted from CouchDB. 
		 * @return Boolean
		 */
		public function get isDeleted():Boolean
		{
			return _isDeleted;
		}
		public function set isDeleted( value:Boolean ):void
		{
			_isDeleted = value;
		}
	}
}