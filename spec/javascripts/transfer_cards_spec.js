//this is simply a duplicate of user_sessions_rspec
describe('TransferCardsPopup', function(){

        describe('setup', function (){
            it('adds pop Div to game room page', function(){
                expect($('#transferCardsPopup')).toExist();
            });
            it('hide Div initially', function(){
                expect($('#transferCardsPopup')).toBeHidden;
            });
        });
        describe('Clicking login function', function (){

            it('calls correct URL', function(){
                loadFixtures("transfer_card.html");
                spyOn($, 'ajax');
                $('#initiate_transfer_button').trigger('click');
                expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/piles/show');
            });
            describe('when successful server call', function (){
                beforeEach(function (){
                    let fixture = setFixtures('<div class="form"/>');
                    let fixHtml = fixture.find('.form');
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