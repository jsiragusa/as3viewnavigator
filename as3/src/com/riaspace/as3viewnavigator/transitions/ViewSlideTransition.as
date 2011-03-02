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

package com.riaspace.as3viewnavigator.transitions
{
	import caurina.transitions.Tweener;
	
	import com.riaspace.as3viewnavigator.IViewNavigator;
	import com.riaspace.as3viewnavigator.IViewTransition;
	import com.riaspace.as3viewnavigator.ViewNavigatorAction;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class ViewSlideTransition implements IViewTransition
	{
		private var _navigator:IViewNavigator;
		
		private var _action:String;
		
		private var _hideView:DisplayObject;
		
		private var _showView:DisplayObject;
		
		private var _transitionDuration:Number = 0.7;
		
		public function ViewSlideTransition(navigator:IViewNavigator)
		{
			_navigator = navigator;
		}
		
		public function play():void
		{
			// Setting variables with function scope
			// in case next transition starts before 
			// current is over
			var hv:DisplayObject = _hideView;
			var sv:DisplayObject = _showView;
			
			// Tweening hideView
			if (hv)
			{
				Tweener.addTween(hv, 
					{
						x : _action == ViewNavigatorAction.PUSH ? -_navigator.width : _navigator.width, 
						time : _transitionDuration,
						onComplete : function():void { Sprite(_navigator).removeChild(hv); }
					});
			}
			
			// Tweening showView
			if (sv)
			{
				sv.x = _action == ViewNavigatorAction.PUSH ? _navigator.width : -_navigator.width;
				sv.y = 0;
				Sprite(_navigator).addChild(sv);
				
				Tweener.addTween(sv, {x : 0, time : _transitionDuration});
			}
		}
		
		public function set navigator(value:IViewNavigator):void
		{
			_navigator = value;
		}
		
		public function set transitionDuration(value:Number):void
		{
			_transitionDuration = value;
		}
		
		public function get transitionDuration():Number
		{
			return _transitionDuration;
		}

		public function set action(value:String):void
		{
			_action = value;
		}
		
		public function set hideView(value:DisplayObject):void
		{
			_hideView = value;
		}
		
		public function set showView(value:DisplayObject):void
		{
			_showView = value;
		}

		public function get navigator():IViewNavigator
		{
			return _navigator;
		}
	}
}