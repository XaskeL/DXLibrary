new = setmetatable( { _new = new }, {
	__index = function ( self, sKey )
		local Space = _G;
	
		if ( not Space [ sKey ] ) then
			return NULL;
		end
		
		return function ( ... )
			return self._new( Space [ sKey ], ... );
		end;
	end;
});