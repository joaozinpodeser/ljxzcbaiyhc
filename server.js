const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('.'));

// Rota principal
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Health check
app.get('/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// API básica para versões
app.get('/api/versions', (req, res) => {
    const versions = [
        { id: '1.20.4', type: 'release' },
        { id: '1.19.4', type: 'release' },
        { id: '1.18.2', type: 'release' },
        { id: '1.16.5', type: 'release' }
    ];
    res.json(versions);
});

app.listen(PORT, () => {
    console.log(`🚀 TLauncher Web Client rodando na porta ${PORT}`);
    console.log(`📱 Acesse: http://localhost:${PORT}`);
});
