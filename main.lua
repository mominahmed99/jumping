-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- created by Momin Ahmed
-- created on April 2018
--
-- when you click on one of the arrows the object will move, the red button lets the 
-- character jump
-----------------------------------------------------------------------------------------
--
local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 )
physics.setDrawMode( "hybrid" )  

local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )
 leftWall.strokeWidth = 3
 leftWall:setFillColor( 0.5 )
 leftWall:setStrokeColor( 1, 0, 0 )
leftWall.alpha = 0.0
physics.addBody( leftWall, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = 1500 
theGround.y = 500 
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local theuperGround = display.newImage( "./assets/sprites/land.png" )
theuperGround.x = 800 
theuperGround.y =  1300 
theuperGround.id = "the uperground"
physics.addBody( theuperGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )


local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 200
dPad.id = "d-pad"

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 310
upArrow.id = "up arrow"

local theCharacter = display.newImage( "./assets/sprites/bird.png" )
theCharacter.x = display.contentCenterX 
theCharacter.y = 200
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3
    } )
theCharacter.isFixedRotation = true

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 88
downArrow.id = "down arrow"

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 198
rightArrow.id = "right arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 198
leftArrow.id = "left arrow"

local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 80
jumpButton.id = "jump button"
jumpButton.alpha = 0.5
 
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        transition.moveBy( theCharacter, { 
        	x = 0, 
        	y = -50, 
        	time = 100 
        	} )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        transition.moveBy( theCharacter, { 
        	x = 0,  
        	y = 50, 
        	time = 100 
        	} )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 50,  
        	y = 0,
        	time = 100
        	} )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        transition.moveBy( theCharacter, { 
        	x = -50,  
        	y = 0, 
        	time = 100 
        	} )
    end

    return true
end

function jumpButton:touch( event )
    if ( event.phase == "ended" ) then
        theCharacter:setLinearVelocity( 0, -750 )
    end

    return true
end

function checkCharacterPosition( event )
    if theCharacter.y > display.contentHeight + 500 then
        theCharacter.x = display.contentCenterX - 200
        theCharacter.y = display.contentCenterY
    end
end

upArrow:addEventListener( "touch", upArrow )

downArrow:addEventListener( "touch", downArrow )

rightArrow:addEventListener( "touch", rightArrow )

leftArrow:addEventListener( "touch", leftArrow )

jumpButton:addEventListener( "touch", jumpButton )

Runtime:addEventListener( "enterFrame", checkCharacterPosition )