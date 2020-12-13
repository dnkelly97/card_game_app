describe('DiscardCardsPopup', function(){

        describe('setup', function (){
            it('adds pop Div to game room page', function(){
                loadFixtures("discard_card.html");
                expect($('#discardCardsPopup')).toExist();
            });
            it('hide Div initially', function(){
                loadFixtures("discard_card.html");
                expect($('#discardCardsPopup')).toBeHidden;
            });
        });
        describe('Clicking discard card button', function (){

            it('calls correct URL', function(){
                loadFixtures("discard_card.html");
                spyOn($, 'ajax');
                $('#discard_button').trigger('click');
                expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/discard_piles');
            });
            describe('when successful server call', function (){
                beforeEach(function (){
                    let fixture = setFixtures('<div class="form"/>');
                    let fixHtml = fixture.find('.form');
                    // Last fixture loaded will be the document DOM. If putting this before let fixture, then
                    // dashboard.html would not exist as the document anymore
                    loadFixtures("discard_card.html");
                    spyOn($, 'ajax').and.callFake(function (ajaxArgs){
                        console.log("This is a spy call for success handler");
                        ajaxArgs.success(fixHtml, '200', null);
                    });
                    $('#discard_button').trigger('click');
                });
                it('popup is Visible', function(){
                    expect($('#discardCardsPopup')).toBeVisible();
                    let fixture2 = setFixtures('<input id="cancel">')
                    let fixHtml2 = fixture2.find('#cancel');
                    $(fixHtml2).trigger('click');
                    expect($('#discardCardsPopup')).toBeHidden();
                });

            });
        });
    }
);