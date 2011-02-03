package com.dayvson.subtitle.config
{
	public class Configuration
	{
		private var _font:String = "Arial";
		private var _size:Number = 14;
		private var _colors:Array = [0xFFCC00, 0x0000FF, 0xFF0000, 0x333333,0x000000];
		private var _color:Number = 0x000000;
		public function Configuration(font:String="Arial", size:Number = 14, color:Number = 0xFFFFFF)
		{
			this.font = font;
			this.size = size;
			this.color = color;
		}

		public function get color():Number
		{
			return _color;
		}

		public function set color(value:Number):void
		{
			_color = value;
		}

		public function get colors():Array
		{
			return _colors;
		}

		public function set colors(value:Array):void
		{
			_colors = value;
		}

		public function get size():Number
		{
			return _size;
		}

		public function set size(value:Number):void
		{
			_size = value;
		}

		public function get font():String
		{
			return _font;
		}

		public function set font(value:String):void
		{
			_font = value;
		}

	}
}