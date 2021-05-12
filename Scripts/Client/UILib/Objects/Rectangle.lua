Rectangle = inherit( IDxObject );

function Rectangle:constructor( iX, iY, iWidth, iHeight, iColor, pParent )
	self.m_iX			= tonumber( iX );
    self.m_iY			= tonumber( iY );
    self.m_iWidth		= tonumber( iWidth );
    self.m_iHeight		= tonumber( iHeight );
    self.m_iColor		= tonumber( iColor );
    self.m_pParent		= pParent;
	
	self.m_bShow		= true;
	
	if ( not pParent ) then
		table.insert( IDxObject.m_aChields, self );
	else
		if ( type( pParent.m_aChields ) == "table" ) then
			self.m_iX = self.m_iX + pParent.m_iX;
			self.m_iY = self.m_iY + pParent.m_iY;
		
			table.insert( pParent.m_aChields, self );
		end
	end
end;

function Rectangle:Draw( )
	dxDrawRectangle( self.m_iX, self.m_iY, self.m_iWidth, self.m_iHeight, self.m_iColor, false );
end;