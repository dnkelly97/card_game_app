describe('LoginPopup', function(){
    beforeEach(function (){
        loadFixtures("dashboard.html");
    });
    describe('setup', function (){
        it('adds pop Div to main page', function(){
            expect($('#loginPopup')).toExist();
        });
        it('hide Div initially', function(){
            expect($('#loginPopup')).toBeHidden;
        });
    });
    describe('Clicking login function', function (){
        it('calls correct URL', function(){
            spyOn($, 'ajax');
            $('#signupLogin').trigger('click');
            expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/login');
        });
        describe('when successful server call', function (){
            beforeEach(function() {
                let fixture = setFixtures('<form class="form"><input type="submit" value="Submit"></form>');
                let fixHtml = fixture.find('.form');
                spyOn($, 'ajax').and.callFake(function (ajaxArgs){
                    ajaxArgs.success(fixHtml, '200');
                });
                $('#signupLogin').trigger('click');
            });
            it('popup is Visible', function(){
                expect($('#loginPopup')).toBeVisible();
            });
            it('hide Div', function(){
                let fixture2 = setFixtures('<input id="cancelLogin">')
                let fixHtml2 = fixture2.find('#cancelLogin');
                $(fixHtml2).click()
                expect($('#loginPopup')).toBeHidden();
            });
        });
    });
    }
);