#!/bin/bash

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

print_color() {
    printf "${1}${2}${NC}\n"
}

print_header() {
    echo ""
    print_color $CYAN "🎮 =================================="
    print_color $CYAN "   TLauncher Web Client Setup"
    print_color $CYAN "🎮 =================================="
    echo ""
}

print_step() {
    print_color $BLUE "📋 $1"
}

print_success() {
    print_color $GREEN "✅ $1"
}

print_warning() {
    print_color $YELLOW "⚠️  $1"
}

print_error() {
    print_color $RED "❌ $1"
}

print_header

# Verificar se Node.js está instalado
print_step "Verificando Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    print_success "Node.js encontrado: $NODE_VERSION"
else
    print_error "Node.js não encontrado!"
    print_warning "Instale Node.js 18+ de https://nodejs.org"
    exit 1
fi

# Verificar se npm está disponível
print_step "Verificando npm..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    print_success "npm encontrado: $NPM_VERSION"
else
    print_error "npm não encontrado!"
    exit 1
fi

# Instalar dependências
print_step "Instalando dependências..."
npm install
print_success "Dependências instaladas"

# Criar diretórios necessários
print_step "Criando estrutura de diretórios..."
mkdir -p data logs assets public
print_success "Diretórios criados"

# Testar a instalação
print_step "Testando a instalação..."
if npm list &> /dev/null; then
    print_success "Instalação verificada com sucesso!"
else
    print_warning "Algumas dependências podem estar faltando"
fi

print_header
print_success "🎉 Setup concluído!"
echo ""
print_color $GREEN "📋 Próximos passos:"
print_color $YELLOW "   1. npm start          - Iniciar servidor"
print_color $YELLOW "   2. npm run dev        - Modo desenvolvimento"
print_color $YELLOW "   3. Acesse: http://localhost:3000"
echo ""
print_color $CYAN "🔧 Comandos úteis:"
print_color $CYAN "   npm start             - Iniciar aplicação"
print_color $CYAN "   npm run build         - Build para produção"
print_color $CYAN "   npm run deploy        - Deploy GitHub Pages"
echo ""
