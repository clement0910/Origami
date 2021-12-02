import Hammer from "hammerjs"

'use strict';

let fetchGroup = false

const initTinder = () => {
  var tinderContainer = document.querySelector('.tinder');
  var allCards = document.querySelectorAll('.tinder--card');

  if (!tinderContainer) return
  var currentUserId = tinderContainer.dataset.userId

  if (allCards.length === 0 || allCards.length <= 1) {
    checkCardsEnding();
  }

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
    var cardsss = document.querySelectorAll('.tinder--card:not(.removed)');

    if (cardsss.length < 1) {
        return true
      }
    return false
  }

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

  async function userInGroup() {
    const url = `/users/${currentUserId}/in-group`;
    const response = await fetch(url, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    });
    if (response.status == 200) {
      const group = await response.json()
      return group
    }
    return false
  }

  function toggleAlgoStart() {
    const containerStartingCard = document.querySelector('.calculating');
    const containerStart = document.querySelector('.calculating--cards');

    fetchGroup = true

    containerStartingCard.classList.remove('hidden');
    containerStart.classList.remove('hidden');
  }

  function toggleAlgoEnd() {
    console.log('ingroup');
    const containerEndingCard = document.querySelector('.calculating2');
    const containerEnd = document.querySelector('.calculating--cards2');
    const users = document.querySelector('.users')
    const containerStartingCard = document.querySelector('.calculating');
    const containerStart = document.querySelector('.calculating--cards');


    containerStartingCard.classList.add('hidden');
    containerStart.classList.add('hidden');

    users.classList.remove('hidden');
    containerEndingCard.classList.remove('hidden');
    containerEnd.classList.remove('hidden');
    window.location.reload()
  }

  const endingWorflow = () => {
    if (checkCardsEnding()) {
      const interval = setInterval(async () => {
        const inGroup = await userInGroup();
        if (inGroup.in_group !== false) {
          clearInterval(interval)
          toggleAlgoEnd()
        } else { toggleAlgoStart() }
      }, 1000)
    }
  }

  initCards();
  if (document.querySelector('.calculating--cards2').classList.contains('hidden'))
    endingWorflow()

  // Methode dans controller Users qui dit si il est dans un grp et qui renvoie du JSON
  // Quand checkCardsEnding renvoie true lancer la boucle qui fetch la méthode dans Users
  // Si User_in_group true on stopp la boucle et on toggle hidden div
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
        event.target.style.transform = '';
      } else {

        const yes = (event.deltaX > 0)

        storeAnswers(el.id, yes)

        endingWorflow()

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
