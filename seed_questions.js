const { initializeApp, cert } = require('firebase-admin/app');
const { getFirestore } = require('firebase-admin/firestore');

const serviceAccount = require('./serviceAccountKey.json');

initializeApp({
  credential: cert(serviceAccount)
});

const db = getFirestore();

const questions = [
  {
    questionText: "음(陰)의 기운을 가장 잘 나타내는 자연 현상은?",
    options: ["태양", "한낮", "달빛", "여름"],
    correctIndex: 2,
    explanationText: "달은 음의 기운을 대표하는 상징입니다. 태양·한낮·여름은 모두 밝고 뜨거운 양(陽)의 기운에 해당합니다."
  },
  {
    questionText: "양(陽)의 기운을 설명하는 방향성으로 올바른 것은?",
    options: ["아래로 내리려는 기운", "위로 솟아오르려는 기운", "안으로 수렴하는 기운", "고요히 머무는 기운"],
    correctIndex: 1,
    explanationText: "양은 확장하고 위로 솟아오르려는 기운입니다. 반면 음은 지키고 아래로 내리려는 기운으로, 두 기운은 서로를 통해 균형을 이룹니다."
  },
  {
    questionText: "음의 기운이 '정신'에 해당한다면, 양의 기운은 무엇에 해당하는가?",
    options: ["감정", "행동하는 몸", "잠재의식", "기억"],
    correctIndex: 1,
    explanationText: "음의 기운이 생각하는 정신이라면, 양의 기운은 행동하는 몸과 같습니다. 음은 내면, 양은 외면과 연결됩니다."
  },
  {
    questionText: "목(木)·화(火)의 기운이 나타내는 성향으로 올바른 것은?",
    options: ["수동적이고 조용한 성향", "지혜롭고 사색적인 성향", "능동적이고 개척하는 성향", "수용하고 안정을 지향하는 성향"],
    correctIndex: 2,
    explanationText: "목·화는 양의 기운을 대표하며, 능동적이고 활동적이며 진취적으로 개척하는 성향으로 나타납니다."
  },
  {
    questionText: "금(金)·수(水)의 기운이 나타내는 성향은?",
    options: ["적극적이고 열정적인 성향", "수동적이고 지혜로운 성향", "외향적이고 표현적인 성향", "개척하고 확장하는 성향"],
    correctIndex: 1,
    explanationText: "금·수는 음의 기운을 대표하며, 수동적이고 조용하며 지혜로운 성향으로 나타납니다."
  },
  {
    questionText: "오행 중 토(土)의 역할로 가장 적절한 것은?",
    options: ["음의 기운을 극대화한다", "양의 기운을 극대화한다", "목·화와 금·수의 기운을 조절하고 안정시킨다", "음양의 흐름을 차단한다"],
    correctIndex: 2,
    explanationText: "토는 목·화(양)와 금·수(음)의 기운을 조절하고 수용하며 안정을 지향합니다."
  },
  {
    questionText: "음양의 관계에 대한 설명으로 옳은 것은?",
    options: ["음과 양은 서로 반대 개념이다", "음이 강하면 양은 사라진다", "음과 양은 서로를 통해 존재 가치가 생긴다", "음양은 독립적으로 작용한다"],
    correctIndex: 2,
    explanationText: "음양은 반대의 의미가 아니라 상대에 의해 존재의 가치가 부여됩니다."
  },
  {
    questionText: "양(陽)만 존재하고 음(陰)이 없다면 어떤 일이 일어나는가?",
    options: ["어둠 속에서 꽃이 싹을 틔우지 못한다", "너무 뜨거워 꽃이 말라버린다", "만물이 고요하게 안정된다", "음양이 균형을 이룬다"],
    correctIndex: 1,
    explanationText: "음이 없이 양만 존재하면 너무 뜨거워 꽃이 말라버립니다."
  },
  {
    questionText: "다음 중 음(陰)의 기운에 해당하는 특성이 아닌 것은?",
    options: ["내성적", "인내심", "적극적", "고요함"],
    correctIndex: 2,
    explanationText: "적극적은 양(陽)의 기운에 해당하는 특성입니다. 음의 기운은 내성적·인내심·고요함처럼 수렴하고 안으로 향하는 성질을 가집니다."
  },
  {
    questionText: "양(陽)의 기운이 강한 사람의 행동 방식으로 가장 가까운 것은?",
    options: ["조용히 연구하며 결과를 기다린다", "감정을 내면에 쌓아두며 참는다", "새로운 것을 개척하고 적극적으로 표현한다", "변화를 거부하고 현재를 유지한다"],
    correctIndex: 2,
    explanationText: "양의 기운은 활발하고 외향적이며 표현적이고 적극적으로 개척하는 성향입니다."
  }
];

async function addQuestions() {
  const batch = db.batch();
  questions.forEach((question) => {
    const docRef = db.collection('daily_challenge').doc();
    batch.set(docRef, question);
  });
  await batch.commit();
  console.log('10개 문제 추가 완료!');
  process.exit(0);
}

addQuestions().catch((err) => {
  console.error(err);
  process.exit(1);
});
