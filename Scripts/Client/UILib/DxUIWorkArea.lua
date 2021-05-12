DxUIWorkArea = inherit( IDxObject );

function DxUIWorkArea:constructor( iX, iY, iWidth, iHeight )
	self.m_aChields	= setmetatable( { }, { __mode = "kv" } );
		
	self.m_iX 		= tonumber( iX );
	self.m_iY 		= tonumber( iY );
	self.m_iWidth 	= tonumber( iWidth );
	self.m_iHeight 	= tonumber( iHeight );
	
	self.m_bShow	= true;
	
	table.insert( IDxObject.m_aChields, self );
end;