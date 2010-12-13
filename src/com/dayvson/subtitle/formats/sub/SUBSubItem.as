package com.dayvson.subtitle.formats.sub
{
	public class SUBSubItem
	{
		
		/*
		{4565}{4673}- Miksi minun on tultava mukaan?|- Koska maito on loppu.
		*/
		public var startTime	:Number = -1;
		public var endTime		:Number = -1;
		public var duration		:Number = -1;
		public var text			:String = "";
		
		private const BLOCK_PATTERN:RegExp = /^(\{.+\})/g;
		private const TIME_PATTERN:RegExp = /([0-9]+)/g; 
		public function SUBSubItem(item:String = null)
		{
			if(item == null) return;
			var result:Array = item.split(BLOCK_PATTERN).slice(1);
			if(result.length < 2) return;
			var times:Array = result[0].match(TIME_PATTERN);
			
			this.startTime = times[0]; 
			this.endTime = times[1];
			this.duration = this.endTime - this.startTime;
			this.text =result[1].split("|").join("\n"); 	

		}
		public function toString():String
		{
			return "[" + this.startTime + " - " + this.endTime + "\n" + text + "]";
		}

	}
}