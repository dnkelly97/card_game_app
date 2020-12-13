describe('LoginPopup', function(){

    describe('setup', function (){
        it('adds pop Div to main page', function(){
            loadFixtures("dashboard.html");
            expect($('#loginPopup')).toExist();
        });
        it('hide Div initially', function(){
            loadFixtures("dashboard.html");
            expect($('#loginPopup')).toBeHidden;
        });
    });
    describe('Clicking login function', function (){

        it('calls correct URL', function(){
            loadFixtures("dashboard.html");
            spyOn($, 'ajax');
            $('#signupLogin').trigger('click');
            expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/login');
        });
        describe('when successful server call', function (){
            beforeEach(function (){
                let fixture = setFixtures('<div class="form"/>');
                let fixHtml = fixture.find('.form');
                // Last fixture loaded will be the document DOM. If putting this before let fixture, then
                // dashboard.html would not exist as the document anymore
                loadFixtures("dashboard.html");
                spyOn($, 'ajax').and.callFake(function (ajaxArgs){
                    console.log("This is a spy call for success handler");
                    ajaxArgs.success(fixHtml, '200', null);
                });
                $('#signupLogin').trigger('click');
            });
            it('popup is Visible', function(){
                expect($('#loginPopup')).toBeVisible();
                let fixture2 = setFixtures('<input id="cancelLogin">')
                let fixHtml2 = fixture2.find('#cancelLogin');
                $(fixHtml2).trigger('click');
                expect($('#loginPopup')).toBeHidden();
            });

        });
    });
    }
);