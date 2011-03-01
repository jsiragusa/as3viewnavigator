//////////////////////////////////////////////////////////////////////////////////////
//
//	Copyright 2011 Piotr Walczyszyn (http://riaspace.com | @pwalczyszyn)
//	
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//	
//		http://www.apache.org/licenses/LICENSE-2.0
//	
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
//	
//////////////////////////////////////////////////////////////////////////////////////

package com.riaspace.as3viewnavigator
{
	import flash.display.DisplayObject;
	
	internal class ViewReference
	{
		public var instance:DisplayObject;
		
		public var viewProps:Object;
		
		public var context:Object;
		
		public var viewClass:Class;
		
		public function ViewReference(view:DisplayObject, viewProps:Object, context:Object)
		{
			this.instance = view;
			this.viewProps = viewProps;
			this.context = context;
			this.viewClass = Object(view).constructor;
		}
	}
}