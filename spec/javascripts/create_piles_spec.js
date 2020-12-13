describe('CreatePilesPopup', function(){

        describe('setup', function (){
            it('adds pop Div to game room page', function(){
                loadFixtures("create_pile.html");
                expect($('#createPilesPopup')).toExist();
            });
            it('hide Div initially', function(){
                loadFixtures("create_pile.html");
                expect($('#createPilesPopup')).toBeHidden;
            });
        });
        describe('Clicking create function', function (){
            it('calls correct URL', function(){
                loadFixtures("create_pile.html");
                spyOn($, 'ajax');
                $('#create_pile').trigger('click');
                expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/create_pile');
            });
            describe('when successful server call', function (){
                beforeEach(function (){
                    let fixture = setFixtures('<div class="form"/>');
                    let fixHtml = fixture.find('.form');
                    // Last fixture loaded will be the document DOM. If putting this before let fixture, then
                    // dashboard.html would not exist as the document anymore
                    loadFixtures("create_pile.html");
                    spyOn($, 'ajax').and.callFake(function (ajaxArgs){
                        console.log("This is a spy call for success handler");
                        ajaxArgs.success(fixHtml, '200', null);
                    });
                    $('#create_pile').trigger('click');
                });
                it('popup is Visible', function(){
                    expect($('#createPilesPopup')).toBeVisible();
                    let fixture2 = setFixtures('<input id="cancel">')
                    let fixHtml2 = fixture2.find('#cancel');
                    $(fixHtml2).trigger('click');
                    expect($('#createPilesPopup')).toBeHidden();
                });
            });
        });
    }
);