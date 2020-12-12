describe('DrawsPopup', function(){

        describe('setup', function (){
            it('adds pop Div to game room page', function(){
                loadFixtures("draw_card.html");
                expect($('#drawPopup')).toExist();
            });
            it('hide Div initially', function(){
                loadFixtures("draw_card.html");
                expect($('#drawPopup')).toBeHidden;
            });
        });
        describe('Clicking draw function', function (){

            it('calls correct URL', function(){
                loadFixtures("draw_card.html");
                spyOn($, 'ajax');
                $('#draw_button').trigger('click');
                expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/get_from_draw_piles');
            });
            describe('when successful server call', function (){
                beforeEach(function (){
                    let fixture = setFixtures('<div class="form"/>');
                    let fixHtml = fixture.find('.form');
                    // Last fixture loaded will be the document DOM. If putting this before let fixture, then
                    // dashboard.html would not exist as the document anymore
                    loadFixtures("draw_card.html");
                    spyOn($, 'ajax').and.callFake(function (ajaxArgs){
                        console.log("This is a spy call for success handler");
                        ajaxArgs.success(fixHtml, '200', null);
                    });
                    $('#draw_button').trigger('click');
                });
                it('popup is Visible', function(){
                    expect($('#drawPopup')).toBeVisible();
                    let fixture2 = setFixtures('<input id="cancel">')
                    let fixHtml2 = fixture2.find('#cancel');
                    $(fixHtml2).trigger('click');
                    expect($('#drawPopup')).toBeHidden();
                });

            });
        });
    }
);