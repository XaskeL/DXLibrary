IDxObject = 
{
	m_aChields = { };
}; setmetatable( IDxObject.m_aChields, { __mode = "kv" } );

function IDxObject:OnRender( )
	for i, pObject in ipairs ( IDxObject.m_aChields ) do
		if ( pObject.m_aChields ) then
			if ( pObject.m_bShow ) then
				for i, pChield in ipairs ( pObject.m_aChields ) do
					if ( pChield.Draw and pChield.m_bShow ) then
						pChield:Draw( );
					end
				end
			end
		else
			if ( pObject.m_bShow ) then
				pObject:Draw( );
			end
		end
	end
end;

addEventHandler( "onClientRender", root, IDxObject.OnRender );

function IDxObject:Destroy( )
	if ( self.m_aChields ) then
		self.m_aChields = { };
	end
	
	for i = table.getn( IDxObject.m_aChields ), 1, -1 do
		if ( IDxObject.m_aChields [ i ] == self ) then
			table.remove( IDxObject.m_aChields, i );
			
			break;
		end
	end
	
	collectgarbage( 'collect' );
end;

function IDxObject:SetVisible( bState )
	self.m_bShow = not not bState;
		
	return self;
end;

function IDxObject:SetColor( iColor )
	self.m_iColor = tonumber( iColor ) or -1;
	
	return self;
end;