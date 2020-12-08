describe('ShowPile', function(){
    it('Should not display the cards in piles when their buttons were not clicked', function(){
        loadFixtures("room.html");
        $("#b1").trigger("click");
        expect(document.getElementById('1').style.display).toEqual("block");
        expect(document.getElementById('2').style.display).toEqual("none");
        expect(document.getElementById('3').style.display).toEqual("none");
    });
    it('Should display the cards in that pile with the click of the button', function(){
        //TODO: make a fixture with buttons and a panel
        // Then call the js function show_piles with the pile id
        loadFixtures("room.html")
        $("#b1").trigger("click");
        expect(document.getElementById('1').style.display).toEqual("block");
        $("#b2").trigger("click");
        expect(document.getElementById('2').style.display).toEqual("block");
        $("#b3").trigger("click");
        expect(document.getElementById('3').style.display).toEqual("block");
    });
    it('Should display the correct number of cards for a pile when the pile\'s button is pressed', function(){
        loadFixtures("room.html")
        $("#b1").trigger("click");
        expect(document.getElementById('1').children.length).toEqual(2);
        $("#b2").trigger("click");
        expect(document.getElementById('2').children.length).toEqual(3);
        $("#b3").trigger("click");
        expect(document.getElementById('3').children.length).toEqual(1);
    })
})