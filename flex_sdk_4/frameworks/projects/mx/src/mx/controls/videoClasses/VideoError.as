////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2005-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.controls.videoClasses 
{

import mx.managers.ISystemManager;
import mx.managers.SystemManager;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

[ResourceBundle("controls")]

/**
 *  The VideoError class represents the error codes for errors 
 *  thrown by the VideoDisplay control.
 *
 *  @see mx.controls.VideoDisplay
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */ 
public class VideoError extends Error 
{
    include "../../core/Version.as";
    
    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------
    
    /**
     *  @private
     *  Base error code
     */
    private static const BASE_ERROR_CODE:uint = 1000;

    /**
     *  Unable to make connection to server or to find FLV on server.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const NO_CONNECTION:uint = 1000;

    /**
     *  No matching cue point found.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const NO_CUE_POINT_MATCH:uint = 1001;

    /**
     *  Illegal cue point.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const ILLEGAL_CUE_POINT:uint = 1002;

    /**
     *  Invalid seek.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const INVALID_SEEK:uint = 1003;

    /**
     *  Invalid content path.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const INVALID_CONTENT_PATH:uint = 1004;

    /**
     *  Invalid XML.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const INVALID_XML:uint = 1005;

    /**
     *  No bitrate match.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const NO_BITRATE_MATCH:uint = 1006;

    /**
     *  Cannot delete default VideoPlayer
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const DELETE_DEFAULT_PLAYER:uint = 1007;
    
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param The error code.
     *
     *  @param msg The error message.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function VideoError(errCode:uint, msg:String = null) 
    {
        super();

        _code = errCode;

        var errorMessages:Array = resourceManager.getStringArray(
            "controls", "errorMessages")
        
        message = "" + errCode + ": " +
                  errorMessages[errCode - BASE_ERROR_CODE] +
                  ((msg == null) ? "" : (": " + msg));
        
        //name = "VideoError";
    }
    
    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Used for accessing localized Error messages.
     */
    private var resourceManager:IResourceManager =
                                    ResourceManager.getInstance();

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  code
    //----------------------------------

    /**
     *  @private
     *  Storage for the code property.
     */      
    private var _code:uint;

    /**
     *  Contains the error code.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get code():uint 
    { 
        return _code; 
    }
}

}
