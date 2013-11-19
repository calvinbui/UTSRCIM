
	function isInteger(fData)
		{
			var reg = new RegExp("^[0-9]+$");
	    	return reg.test(fData);
		}
	
	function isEmail(fData)
	{
		var reg = new RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
		return reg.test(fData);
	}
	
		function validateForm(thisform) {
		//basic info
			
		if(thisform.firstName.value == null || thisform.firstName.value == "")
			{
				alert("Please enter first name");
				return false;
			}
		
		if(thisform.lastName.value == null || thisform.lastName.value == "")
		{
			alert("Please enter last name");
			return false;
		}
		
		if((thisform.dayBirth.value == "" || thisform.dayBirth.value == null) && (thisform.monthBirth.value == "" || thisform.monthBirth.value == null) && (thisform.yearBirth.value == "" || thisform.yearBirth.value == null))
		{
			alert("Please enter date of birth");
			return false;
		}
		
		if(!isInteger(thisform.dayBirth.value) || !isInteger(thisform.monthBirth.value) || !isInteger(thisform.yearBirth.value))
		{
			alert("Date of birth must be numeric");
			return false;
		}
		
		if((thisform.dayBirth.value.length != 2) || (thisform.monthBirth.value.length != 2) || (thisform.yearBirth.value.length != 4))
		{
			alert("Invalid date of birth");
			return false;
		}
		
		
		//contact details
		
			
		if(thisform.email.value == "" || thisform.email.value == null)
		{
			alert("Please enter an email address");
			return false;
		}
		
		if(thisform.email.value.length > 0 && !isEmail(thisform.email.value))
		{
			alert("Please enter a valid email address");
			return false;
		}
		
		if(thisform.homePhone.value == "" || thisform.homePhone.value == null)
		{
			alert("Please enter home number");
			return false;
		}
		
		if(thisform.homePhone.value.length > 0 && !isInteger(thisform.homePhone.value))
		{
				alert("Home number must be numeric");
				return false;
		}
		
		if(thisform.homePhone.value.length > 10)
		{
				alert("Home number is invalid");
				return false;
		}
		
		
		if(thisform.homePhone.value.length > 0 && !isInteger(thisform.homePhone.value))
		{
			alert("Home number must be numeric");
			return false;
		}
		
		if(thisform.streetResidential.value == "" || thisform.streetResidential.value == null)
		{
			alert("Please enter address");
			return false;
		}
		
		if(thisform.suburbResidential.value == "" || thisform.suburbResidential.value == null)
		{
			alert("Please enter suburb");
			return false;
		}
		
		if(thisform.postCodeResidential.value == "" || thisform.postCodeResidential.value == null)
		{
			alert("Please enter postode");
			return false;
		}
		
		if(thisform.postCodeResidential.value.length > 0 && !isInteger(thisform.postCodeResidential.value))
		{
			alert("Post code must be numeric");
			return false;
		}
		
		if(thisform.postCodeResidential.value.length != 4)
		{
			alert("Post code must be 4 numbers long");
			return false;
		}
		
		if (document.getElementById('postalCheckID').checked)
			{
				if(thisform.streetPostal.value == "" || thisform.streetPostal.value == null)
				{
					alert("Please enter address");
					return false;
				}
			
				if(thisform.suburbPostal.value == "" || thisform.suburbPostal.value == null)
				{
					alert("Please enter suburb");
					return false;
				}
				
				if(thisform.postCodePostal.value == "" || thisform.postCodePostal.value == null)
				{
					alert("Please enter postode");
					return false;
				}
				
				if(thisform.postCodePostal.value.length > 0 && !isInteger(thisform.postCodePostal.value))
				{
					alert("Post code must be numeric");
					return false;
				}
				
				if(thisform.postCodePostal.value.length != 4)
				{
					alert("Post code must be 4 numbers long");
					return false;
				}
			}
		if(document.getElementById("Other").checked)
		{
				if(thisform.otherReasonForJob.value == "" || thisform.otherReasonForJob.value == null)
					{
						alert("Please enter a reason");
						return false;
					}
		}
		if(document.getElementById("temp").checked)
		{
			if(thisform.visa.value == "" || thisform.visa.value == null)
			{
				alert("Please enter a visa type");
				return false;
			}
			if(thisform.passport.value == "" || thisform.passport.value == null)
			{
				alert("Please enter a passport no.");
				return false;
			}
			if(thisform.countryOfIssue.value == "" || thisform.passportcountry.value == null)
			{
				alert("Please enter a visa country of issue");
				return false;
			}
		}
		if(thisform.bsb.value == "" || thisform.bsb.value == null)
		{
			alert("Please enter BSB number");
			return false;
		}
					
		if(thisform.bsb.value.length > 0 && !isInteger(thisform.bsb.value))
		{
			alert("BSB must be numeric");
			return false;
		}
		
		if(thisform.bsb.value.length != 6)
		{
			alert("BSB is invalid");
			return false;
		}
		
		
		if(thisform.accountNumber.value == "" || thisform.accountNumber.value == null)
		{
			alert("Please enter account number");
			return false;
		}
					
		if(thisform.accountNumber.value.length > 0 && !isInteger(thisform.accountNumber.value))
		{
			alert("Account number must be numeric");
			return false;
		}
		
		if(thisform.accountNumber.value.length > 9)
		{
			alert("Account number is invalid");
			return false;
		}
		
		if(thisform.financialInstitution.value == "" || thisform.financialInstitution.value == null)
		{
			alert("Please enter financial institution");
			return false;
		}
		
		if(thisform.branchName.value == "" || thisform.branchName.value == null)
		{
			alert("Please enter branch name");
			return false;
		}
		
		//emergency contact
		
		if(thisform.emergfirstName.value == "" || thisform.emergfirstName.value == null)
		{
			alert("Please enter emergency contact first name");
			return false;
		}
		
		if(thisform.emerglastName.value == "" || thisform.emerglastName.value == null)
		{
			alert("Please enter emergency contact last name");
			return false;
		}
		
		if(thisform.telephoneDay.value == "" || thisform.telephoneDay.value == null)
		{
			alert("Please enter daytime contact number");
			return false;
		}
					
		if(thisform.telephoneDay.value.length > 0 && !isInteger(thisform.telephoneDay.value))
		{
			alert("Daytime number must be numeric");
			return false;
		}
		
		if(thisform.telephoneDay.value.length > 10)
		{
				alert("Daytime number is invalid");
				return false;
		}
		
		
		if(thisform.telephoneMobile.value == "" || thisform.telephoneMobile.value == null)
		{
			alert("Please enter mobile number");
			return false;
		}
					
		if(thisform.telephoneMobile.value.length > 0 && !isInteger(thisform.telephoneMobile.value))
		{
			alert("Mobile number must be numeric");
			return false;
		}
		
		if(thisform.telephoneMobile.value.length > 10)
		{
				alert("Mobile number is invalid");
				return false;
		}
		
		if(thisform.relationship.value == "" || thisform.relationship.value == null)
		{
			alert("Please enter relationship");
			return false;
		}
		return true;
	}