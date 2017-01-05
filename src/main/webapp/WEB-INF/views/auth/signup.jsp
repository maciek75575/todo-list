<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<form:form class="col s12 m12 l10 offset-l1" id="formSignUp"
		method="POST" modelAttribute="formSignUp">
		<div class="row">
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">face</i>
					<form:input type="text" path="firstName" name="firstName"
						id="firstName" autocomplete="off" length="40" maxlength="40" required="required" />
					<label for="firstName">Imię *</label>
				</div>
				<div class="col s12 center-align" id="firstNameError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">face</i>
					<form:input type="text" path="lastName" name="lastName"
						id="lastName" autocomplete="off" length="40" maxlength="40" />
					<label for="lastName">Nazwisko</label>
				</div>
				<div class="col s12 center-align" id="lastNameError"></div>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">account_circle</i>
					<form:input type="text" path="login" name="login" id="login"
						autocomplete="off" length="30" maxlength="30" pattern="\w+" required="required" />
					<label for="login">Nazwa użytkownika *</label>
				</div>
				<div class="col s12 center-align" id="loginError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">phone</i>
					<form:input type="tel" path="phoneNumber" name="phoneNumber"
						id="phoneNumber" autocomplete="off" length="11" maxlength="11" pattern="(?=.*\d).{9,}" />
					<label for="phoneNumber">Numer telefonu</label>
				</div>
				<div class="col s12 center-align" id="phoneNumberError"></div>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i>
					<form:input type="password" path="password" name="password"
						id="password" autocomplete="off" length="30" maxlength="30"
						pattern="\w{6,}" required="required" />
					<label for="password">Hasło *</label>
				</div>
				<div class="col s12 center-align" id="passwordError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i>
					<form:input type="password" path="repeatPassword"
						name="repeatPassword" id="repeatPassword" autocomplete="off"
						length="30" maxlength="30" pattern="\w{6,}" required="required" />
					<label for="repeatPassword">Powtórz hasło *</label>
				</div>
				<div class="col s12 center-align" id="repeatPasswordError"></div>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">email</i>
					<form:input type="email" path="email" name="email" id="email"
						autocomplete="off" length="254" maxlength="254" required="required" />
					<label for="email">E-mail *</label>
				</div>
				<div class="col s12 center-align" id="emailError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">email</i>
					<form:input type="email" path="repeatEmail" name="repeatEmail"
						id="repeatEmail" autocomplete="off" length="254" maxlength="254" required="required" />
					<label for="repeatEmail">Powtórz e-mail *</label>
				</div>
				<div class="col s12 center-align" id="repeatEmailError"></div>
			</div>
		</div>
		<button class="hidden" id="submitBtn" type="submit" name="submit"></button>
	</form:form>
	
	<div class="row center-align">
		<div class="input-field col s12">
			<button class="btn btn-flat waves-effect waves-green" onclick="checkForm();">
				Zarejestruj<i class="material-icons right">send</i>
			</button>
		</div>
	</div>
</div>

<div id="errorModal" class="modal">
	<div class="modal-content red lighten-4">
		<h4>Formularz zawiera błędy<i class="material-icons right" style="font-size:inherit;">error_outline</i></h4>
		<p>Popraw błędy występujące w formularzu i spóbuj ponownie.</p>
	</div>
	<div class="modal-footer red accent-1">
		<a onclick="javascript:$('#errorModal').modal('close');" class="modal-action modal-close waves-effect waves-green btn-flat">Zamknij</a>
	</div>
</div>

<div class="fixed-action-btn">
	<a class="btn-floating btn-large waves-effect waves-light blue darken-2" onclick="javascript:$('#helpModal').modal('open');">
		<i class="material-icons light-blue-text text-lighten-4" style="font-size: 40px;">help_outline</i>
	</a>
</div>
<div id="helpModal" class="modal modal-fixed-footer">
	<div class="modal-content light-blue lighten-4">
		<h4>Pomoc<i class="material-icons right" style="font-size:inherit;">help_outline</i></h4>
		<table>
        <tbody>
          <tr>
            <th class="right-align no-space">Imię:</th>
            <td>Pole wymagane. Maksymalna długość wynosi 40 znaków.</td>
          </tr>
          <tr>
            <th class="right-align no-space">Nazwisko:</th>
            <td>Pole opcjonalne. Maksymalna długość wynosi 40 znaków.</td>
          </tr>
          <tr>
            <th class="right-align no-space">Login:</th>
            <td>Pole wymagane. Maksymalna długość wynosi 30 znaków. Może zawierać duże i małe litery alfabetu łacińskiego, cyfry oraz znak _.</td>
          </tr>
          <tr>
            <th class="right-align no-space">Hasło:</th>
            <td>Pole wymagane. Długość hasła musi wynosić od 6 do 30 znaków. Może zawierać duże i małe litery alfabetu łacińskiego, cyfry oraz znak _.</td>
          </tr>
          <tr>
            <th class="right-align no-space">E-mail:</th>
            <td>Pole wymagane. Maksymalna długość wynosi 254 znaków. Wymagany format: "nazwa@domena".</td>
          </tr>
          <tr>
            <th class="right-align no-space">Telefon:</th>
            <td>Pole opcjonalne. Długość numeru telefonu wynosi od 9 do 11 znaków. Może składać się wyłącznie z cyfr.</td>
          </tr>
        </tbody>
      </table>
	</div>
	<div class="modal-footer blue lighten-3">
		<a onclick="javascript:$('#helpModal').modal('close');" class="modal-action modal-close waves-effect waves-green btn-flat">Zamknij</a>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.modal').modal();
			
		$("form").each(function() {
			this.addEventListener("invalid", function(event) {
				event.preventDefault();
			},true );
		});
	});

	$('form input').keyup(function() {
		var id = '#' + this.name + 'Error';
		if (this.checkValidity() == false) {
			$(id).empty();
			$(id).append(this.validationMessage);
		}
		else if (this.name == 'repeatEmail') {
			if (isEmailEqual())
				$(id).empty();
			else {
				$(id).empty();
				$(id).append('Adresy e-mail muszą być jednakowe.');
			}
		}
		else if (this.name == 'repeatPassword') {
			if (isPassEqual())
				$(id).empty();
			else {
				$(id).empty();
				$(id).append('Hasła muszą być jednakowe.');
			}
		}
		else if (this.name == 'email') {
			$(id).empty();
			if ($('#repeatEmail')[0].checkValidity()) {
				if (isEmailEqual())
					$('#repeatEmailError').empty();
				else {
					$('#repeatEmailError').empty();
					$('#repeatEmailError').append('Adresy e-mail muszą być jednakowe.');
				}
			}
		}
		else if (this.name == 'password') {
			$(id).empty();
			if ($('#repeatPassword')[0].checkValidity()) {
				if (isPassEqual())
					$('#repeatPasswordError').empty();
				else {
					$('#repeatPasswordError').empty();
					$('#repeatPasswordError').append('Hasła muszą być jednakowe.');
				}
			}
		}
		else
			$(id).empty();
	});
	
	var delay = (function(){
		var timer = 0;
		return function(callback, ms){
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
		};
	})();
	 
	$('#login').keyup(function() {
		delay(function(){
			isLoginAvailable();
		}, 500);
	});
	
	$('#email').keyup(function() {
		delay(function(){
			isEmailAvailable();
		}, 500);
	});
	
	function confirm() {
		$('form input').each(function() {
			var id = '#'+this.name+'Confirm';
			if ($(id).length) {
				$(id).empty();
				$(id).append($(this).val());
			}
		});
	};
	
	function checkLogin() {
		return $.ajax({
			method: 'POST',
			url: '/api/loginAvailable',
			contentType: 'text/plain',
			data: $('#login').val()
		});
	}
	
	function checkEmail() {
		return $.ajax({
			method: 'POST',
			url: '/api/emailAvailable',
			contentType: 'text/plain',
			data: $('#email').val()
		});
	}

	var loginError = false;
	var emailError = false;
	
	function isLoginAvailable() {
		var login = $('#login').val();
		if (login.length) {
			checkLogin().done(function(response){
				if (!response) {
					var id = '#loginError';
					$(id).empty();
					$(id).append('Wybrany login jest zajęty.');
					loginError = true;
				}
				else loginError = false;
			});
		}
	}
	
	function isEmailAvailable() {
		var email = $('#email').val();
		if (email.length) {
			checkEmail().done(function(response){
				if (!response) {
					var id = '#emailError';
					$(id).empty();
					$(id).append('Dla podanego adresu istnieje już konto.');
					emailError = true;
				}
				else emailError = false;
			});
		}
	}
	
	function isEmailEqual() {
		return ($('#email').val() == $('#repeatEmail').val());
	}
	
	function isPassEqual() {
		return ($('#password').val() == $('#repeatPassword').val());
	}
	
	function checkForm() {
		var valid = true;

		$('form input').each(function() {
			if (this.checkValidity() == false) valid = false;
		});
		
		if (valid && isEmailEqual() && isPassEqual()) {
			$.when(checkLogin(), checkEmail()).done(function(login, email) {
				if (login[0] && email[0])
					$('#submitBtn').click();
				else 
					$('#errorModal').modal('open');
			}).fail(function() {
				$('#submitBtn').click();
			});
		}
		else 
			$('#errorModal').modal('open');
	}
</script>

<%@include file="../mainFooter.jsp"%>