/// @function               move_follow(_object, _speed);
/// @param  {index} _object The Object to follow
/// @param  {real}  _speed  The speed to follow at
///********************* EXAMPLE^*********

function string_split(_str, _char){
	
	var _index = 0;
	var _array; //array to hold all the string pieces
	var _strPiece = ""; //var to hold the current piece we're working on building

	for (var i = 1; i < (string_length(_str)+1); i++) 
	{
	    var _cursor = string_copy(_str, i, 1);
		
	    if (_cursor == _char) 
		{
	        _array[_index] = _strPiece; //add this split to the array of all _array
	        _index++;
	        _strPiece = "";
	    } 
		else 
		{
	        _strPiece = _strPiece + _cursor;
	        _array[_index] = _strPiece;
	    }
	}
	return _array;
}
