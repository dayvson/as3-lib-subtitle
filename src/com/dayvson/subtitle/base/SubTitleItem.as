package com.dayvson.subtitle.base
{
	import com.dayvson.subtitle.interfaces.ISubTitleItem;

	public class SubTitleItem implements ISubTitleItem
	{
		private var _index		:Number = -1;
		private var _startTime	:Number = -1;
		private var _endTime	:Number = -1;
		private var _startFrame	:Number = -1;
		private var _endFrame	:Number = -1;
		private var _duration	:Number = -1;
		private var _text		:String = "";
		
		public function SubTitleItem(item:Object = null)
		{
			if(item != null){
				this.startTime = item.startTime||-1;
				this.endTime = item.endTime||-1;
				this.text = item.text||"";
				this.index = item.index || -1;
				this.startFrame = item.startFrame || -1;
				this.endFrame = item.endFrame || -1;
			}
		}
		public function toString():String{
			return "[" + this.startTime + " - " + this.endTime + "\n" + text + "]";
		}
		
		public function get endFrame():Number{
			return _endFrame;
		}

		public function set endFrame(value:Number):void{
			_endFrame = value;
		}

		public function get startFrame():Number{
			return _startFrame;
		}

		public function set startFrame(value:Number):void{
			_startFrame = value;
		}

		public function get duration():Number{
			return this.endTime - this.startTime;
		}

		public function get endTime():Number{
			return _endTime;
		}

		public function set endTime(value:Number):void{
			_endTime = value;
		}

		public function get startTime():Number{
			return _startTime;
		}

		public function set startTime(value:Number):void{
			_startTime = value;
		}

		public function get index():Number{
			return _index;
		}

		public function set index(value:Number):void{
			_index = value;
		}

		public function get text():String{
			return _text;
		}

		public function set text(value:String):void{
			_text = value;
		}
	}
}