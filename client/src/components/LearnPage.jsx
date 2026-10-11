import { useState } from 'react';
import LessonAnimator from './LessonAnimator.jsx';
import GraphPlayground from './GraphPlayground.jsx';

export default function LearnPage({ toast, fireConfetti }) {
  const [tab, setTab] = useState('solve');
  return (
    <main className="page">
      <div className="page-head">
        <h2>🎓 Learn</h2>
        <p className="muted">Watch exponential and log equations get solved step by step, then play with the curves on the graph.</p>
      </div>
      <div className="auth-tabs" style={{ maxWidth: 420, marginBottom: 20 }}>
        <button type="button" className={'auth-tab' + (tab === 'solve' ? ' active' : '')}
          onClick={() => setTab('solve')}>🧮 Solve step-by-step</button>
        <button type="button" className={'auth-tab' + (tab === 'graph' ? ' active' : '')}
          onClick={() => setTab('graph')}>📈 Graph playground</button>
      </div>
      {tab === 'solve'
        ? <LessonAnimator toast={toast} fireConfetti={fireConfetti} />
        : <GraphPlayground />}
    </main>
  );
}
