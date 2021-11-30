import Hammer from "hammerjs"

'use strict';



const initTinder = () => {
  var tinderContainer = document.querySelector('.tinder');
  var allCards = document.querySelectorAll('.tinder--card');
  var nope = document.getElementById('nope');
  var love = document.getElementById('love');

  function initCards(card, index) {
    var newCards = document.querySelectorAll('.tinder--card:not(.removed)');

    newCards.forEach(function (card, index) {
      card.style.zIndex = allCards.length - index;
      card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
      card.style.opacity = (10 - index) / 5;
    });

    if (tinderContainer) {
      tinderContainer.classList.add('loaded');
    }
  }

  function checkCardsEnding () {

    // var containerEndingCard = document.querySelector('.calculating--card');
    // var endingCard = document.querySelector('.calculating')
    // var endingImage = document.querySelector('.calculating--image')

    // containerEndingCard.classList.remove();
    // endingCard.classList.remove();
    // endingImage.classList.remove();

    document.querySelectorAll('.tinder--card:not(.removed)').length;
    if (document.querySelectorAll('.tinder--card:not(.removed)').length === 1) {

      // element.classList.add('.calculating--card', '.calculating', '.calculating--image');

    }
  }

  initCards();

  function storeAnswers(questionId, answer) {
    const csrfToken = document.querySelector("[name='csrf-token']").content

    const url = `${window.location.href}-answer`;
    fetch(url, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": csrfToken,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({question_id: questionId, answer: answer})
    });
  }

  allCards.forEach(function (el) {
    var hammertime = new Hammer(el);

    hammertime.on('pan', function (event) {
      el.classList.add('moving');
    });

    hammertime.on('pan', function (event) {
      if (event.deltaX === 0) return;
      if (event.center.x === 0 && event.center.y === 0) return;

      tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
      tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
      if (event.deltaX > 0) {
        event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(-10deg)';
      } else {
        event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(10deg)';
      }
    });

    hammertime.on('panend', function (event) {
      el.classList.remove('moving');
      tinderContainer.classList.remove('tinder_love');
      tinderContainer.classList.remove('tinder_nope');

      var moveOutWidth = document.body.clientWidth;
      var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

      event.target.classList.toggle('removed', !keep);

      if (keep) {
        console.log("je suia dans le if");
        event.target.style.transform = '';
      } else {


        console.log(event);
        const yes = (event.deltaX > 0)
        storeAnswers(el.id, yes)
        checkCardsEnding();

        var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
        var toX = event.deltaX > 0 ? endX : -endX;
        var endY = Math.abs(event.velocityY) * moveOutWidth;
        var toY = event.deltaY > 0 ? endY : -endY;

        event.target.style.transform = 'translate(' + toX * 10 + 'px, ' + (toY + event.deltaY) + 'px) rotate(10deg)';
        initCards();
      }
    });
  });
}

export { initTinder }
