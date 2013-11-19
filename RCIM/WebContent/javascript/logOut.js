     function confirmLogOut()
     {
    	 if (confirm( "Are you sure you want to log out?" ) )
    	    {
    	        setCookie( "Login", 0 );
    	        return true;
    	    }
    	    else
    	        return false;
     }