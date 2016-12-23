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
						id="firstName" autocomplete="off" length="40" maxlength="40"
						class="validate" required="required" />
					<label for="firstName">Imię *</label>
				</div>
				<div class="col s12 center-align" id="firstNameError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">face</i>
					<form:input type="text" path="lastName" name="lastName"
						id="lastName" autocomplete="off" length="40" maxlength="40"
						class="validate" />
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
						autocomplete="off" length="30" maxlength="30" class="validate"
						pattern="\w+" required="required" />
					<label for="login">Nazwa użytkownika *</label>
				</div>
				<div class="col s12 center-align" id="loginError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">phone</i>
					<form:input type="tel" path="phoneNumber" name="phoneNumber"
						id="phoneNumber" autocomplete="off" length="11" maxlength="11"
						pattern="(?=.*\d).{9,}" class="validate" />
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
						class="validate" pattern="\w{6,}" required="required" />
					<label for="password">Hasło *</label>
				</div>
				<div class="col s12 center-align" id="passwordError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i>
					<form:input type="password" path="repeatPassword"
						name="repeatPassword" id="repeatPassword" autocomplete="off"
						length="30" maxlength="30" class="validate" pattern="\w{6,}"
						required="required" />
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
						autocomplete="off" length="254" maxlength="254" class="validate"
						required="required" />
					<label for="email">E-mail *</label>
				</div>
				<div class="col s12 center-align" id="emailError"></div>
			</div>
			<div class="col s12 m6">
				<div class="input-field col s12">
					<i class="material-icons prefix">email</i>
					<form:input type="email" path="repeatEmail" name="repeatEmail"
						id="repeatEmail" autocomplete="off" length="254" maxlength="254"
						class="validate" required="required" />
					<label for="repeatEmail">Powtórz e-mail *</label>
				</div>
				<div class="col s12 center-align" id="repeatEmailError"></div>
			</div>
		</div>
		<div class="row center-align">
			<div class="input-field col s12">
				<button class="hidden" id="submitBtn" type="submit" name="submit"></button>
				<button class="btn waves-effect waves-light" onclick="submitCheck()">
					Zarejestruj<i class="material-icons right">send</i>
				</button>
				<a class="btn waves-effect waves-light" href="#errorModal">Modal</a>
				<a class="btn waves-effect waves-light" href="#confirmModal" onclick="confirm();">Modal2</a>
			</div>
		</div>
	</form:form>
</div>

<div id="confirmModal" class="modal modal-fixed-footer">
	<div class="modal-content light-green lighten-3">
		<h4>Formularz wypełniony poprawnie<i class="material-icons right" style="font-size:inherit;">done</i></h4>
		<table>
        <tbody>
          <tr>
            <th class="right-align no-space">Imię:</th>
            <td id="firstNameConfirm"></td>
          </tr>
          <tr>
            <th class="right-align no-space">Nazwisko:</th>
            <td id="lastNameConfirm"></td>
          </tr>
          <tr>
            <th class="right-align no-space">Login:</th>
            <td id="loginConfirm"></td>
          </tr>
          <tr>
            <th class="right-align no-space">Hasło:</th>
            <td id="passwordConfirm"></td>
          </tr>
          <tr>
            <th class="right-align no-space">E-mail:</th>
            <td id="emailConfirm"></td>
          </tr>
          <tr>
            <th class="right-align no-space">Telefon:</th>
            <td id="phoneNumberConfirm"></td>
          </tr>
        </tbody>
      </table>
	</div>
	<div class="modal-footer light-green lighten-2">
		<a onclick="javascript:$('#confirmModal').modal('close');" class="modal-action modal-close waves-effect waves-green btn-flat">Wróć</a>
		<a onclick="javascript:$('#confirmModal').modal('close');" class="modal-action modal-close waves-effect waves-green btn-flat">Potwierdź</a>
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
	$(document).ready(
			function() {
				$('.modal').modal();
				
				$("form").each(function() {
				    this.addEventListener("invalid", function(event) {
				        event.preventDefault();
				    }, true );
				});
			});

	$('form input').keyup(function() {
		var id = '#' + this.name + 'Error';
		if (this.checkValidity() == false) {
			$(id).empty();
			$(id).append(this.validationMessage);
		} else
			$(id).empty();
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

	function submit() {
		$('#submitBtn').click();
	};
</script>

<%@include file="../mainFooter.jsp"%>