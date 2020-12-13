describe('TransferCardsPopup', function(){

        describe('setup', function (){
            it('adds pop Div to game room page', function(){
                loadFixtures("transfer_card.html");
                expect($('#transferCardsPopup')).toExist();
            });
            it('hide Div initially', function(){
                loadFixtures("transfer_card.html");
                expect($('#transferCardsPopup')).toBeHidden;
            });
        });
        describe('Clicking transfer button', function (){
            describe('when successful server call', function (){
                beforeEach(function (){
                    let fixture = setFixtures('<div class="form"/>');
                    let fixHtml = fixture.find('#transfer_cards');
                    // Last fixture loaded will be the document DOM. If putting this before let fixture, then
                    // dashboard.html would not exist as the document anymore
                    loadFixtures("transfer_card.html");
                    spyOn($, 'ajax').and.callFake(function (ajaxArgs){
                        console.log("This is a spy call for success handler");
                        ajaxArgs.success(fixHtml, '200', null);
                    });
                    $('#initiate_transfer_button').trigger('click');
                });
                it('popup is Visible', function(){
                    expect($('#transferCardsPopup')).toBeVisible();
                    let fixture2 = setFixtures('<input id="cancel">')
                    let fixHtml2 = fixture2.find('#cancel');
                    $(fixHtml2).trigger('click');
                    expect($('#transferCardsPopup')).toBeHidden();
                });
            });
        });
    }
);