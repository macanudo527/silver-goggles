$.getJSON(`${window.location.href}.json`, initCards);

var showable = [];
var quizable = [];
var shown_cards = 0;
var quizzed_cards = 0;
var total_questions = 0;
var first_answers = [];
var answers = [];

function initCards(data) {

  // Don't show cards that have already been shown once unless the user has completely missed them.
  showable = data.part_of_set.filter(function(entry) {
    return entry.mastery == 0;
  });

  //move the unshown cards automatically to the quizable cards
  quizable = data.part_of_set.filter(function(entry) {
    return entry.mastery != 0;
  })

  total_questions = data.part_of_set.length;


  //Possible answers
  answers = data.part_of_set.map(item => item.definition);

  //Pad answers to make sure there are enough and if there are
  //a small number of answers it is a little more challenging
  answers = answers.concat(data.extra_answers.map(item => item.definition));

  //Initial setup of card
  //If no zero mastery cards skip to just quizzing.
  if (showable.length > 0) {
    change_card(showable.shift(), true);
  } else {
    quizzed = quizable.shift();

    change_card(quizzed, false);    
  }
}

function flipIt() {
  $(".flash-card").toggleClass("flipped");  
};

function change_card(card, show) {
  if (show) {
    $("#japanese-word").html(card.base_word);
    if (card.reading != card.base_word) {
      $("#japanese-reading").html(card.reading);
    } else {
      $("#japanese-reading").html("");
    }
    $("#english-def").html(card.definition); 

    //Reset card to front to show the Japanese word first
    if ($(".flash-card").hasClass("flipped")) {
      $(".flash-card").removeClass("flipped")
    };

    //Then reveal the card
    $("#showable-box, .flash-card").show();

    //Hide unnecessary elements
    $(".prompt-container, .answers").hide();

    quizable.push(card);
  } else {
    $("#showable-box, .flash-card").hide();

    $(".prompt-container, .answers").show();

    $("#prompt").html(card.base_word);
    $("#prompt-reading").html(card.reading);

    // Randomly assign the correct answer to one of the four choices
    correct_answer = Math.floor(Math.random() * 4);
    var incorrect_answers = [];

    // Pick three other answers to assign to the other multiple choices, making sure they do not equal the correct answer.
    while(incorrect_answers.length < 3){
      var r = Math.floor(Math.random() * answers.length);
      if((incorrect_answers.indexOf(r) === -1) && (answers[r] != card.definition)) incorrect_answers.push(r);    
    }

    $(`#answer${correct_answer}`).html(card.definition);
    // Assign incorrect answers to the choices
    for(i = 0; i < 4; i++) {
      if (i != correct_answer) {
        $(`#answer${i}`).html(answers[incorrect_answers.shift()]);       
      };
    };
  };
};

// Card can be flipped by either clicking on the card itself or the flip card button
$(".flash-card, #flip-card-button").on('click', flipIt);

$("#next-card-button").click(function(){
  console.log("clicked on next card");
  shown_cards++;
  if ((shown_cards < 2) && (showable.length != 0)) {
    change_card(showable.shift(), true);
  } else {

    shown_cards = 0;
    quizzed = quizable.shift();

    change_card(quizzed, false);

  };
});

$("#answer0, #answer1, #answer2, #answer3").click(function(){
  $("#nextq-box").show();
  $(`#answer${correct_answer}`).addClass("correct");

  if ($(event.target).is(`#answer${correct_answer}`)) {
    accuracy = 1;

  } else {
    quizable.push(quizzed);
    accuracy = 0;
    $(event.target).addClass("incorrect");

  };
  if (!(quizzed.id in first_answers)) {
    first_answers[quizzed.id] = accuracy;
    $.ajax({ url: '/answers.json', type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { answer: {entry_id: quizzed.id, correct: accuracy } },
      success: function(data, status, jqXHR) {// success callback
     //  alert('status: ' + status + ', data: ' + data );
      }
    });    
  };  
});


$("#nextq-box").click(function(){
  $("#answer0, #answer1, #answer2, #answer3").removeClass("correct");
  $("#answer0, #answer1, #answer2, #answer3").removeClass("incorrect");
  $("#nextq-box").hide();
  if (quizable.length > 2) {
    quizzed = quizable.shift();
    change_card(quizzed, false);
  } else if (showable.length > 0) {
    change_card(showable.shift(), true);
  } else if ((showable.length === 0) && (quizable.length > 0)) {
    quizzed = quizable.shift();
    change_card(quizzed, false);
  } else {
    // Present results
    total_accuracy = 0;
    for (var key in first_answers) {
      if (first_answers.hasOwnProperty(key)) {
          total_accuracy += first_answers[key];
      };
    };
    $(".prompt-container, .answers").hide();
    $(".results-container").show();
    $("#read-box").show();
    percentage = ((total_accuracy / total_questions) * 100).toFixed(2);
    $("#accuracy").text(`${total_accuracy}/${total_questions} (${percentage}%)`);
  };
});

function zeroMastery(entry) {
  return entry.mastery = 0;
}


