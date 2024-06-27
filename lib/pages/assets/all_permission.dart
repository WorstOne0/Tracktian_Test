var allPermisisonsList = [
  {
    "label": "Administração",
    "value": "administracao_menu",
    "children": [
      {
        "label": "Controle",
        "value": "adm.con",
        "children": [
          {
            "label": "Controle",
            "value": "adm.con.controle",
            "children": [
              {"label": "Sessões", "value": "adm.con.controle.sessoes"},
              {
                "label": "Tratativas de erros",
                "value": "adm.con.controle.tratativa_de_erros",
              },
              {"label": "Buscar dados", "value": "buscar_dados"},
            ],
          },
          {
            "label": "Tarefas Assíncronas",
            "value": "adm.con.tarefas",
            "children": [
              {"label": "Listar", "value": "adm.con.tarefas.listar"}
            ],
          },
        ],
      },
      {
        "label": "Sistema",
        "value": "adm.sis",
        "children": [
          {
            "label": "Aplicação",
            "value": "adm.sis.aplicacao",
            "children": [
              {
                "label": "Lista",
                "value": "adm.sis.aplicacao.lista",
              },
              {
                "label": "Adicionar",
                "value": "adm.sis.aplicacao.adicionar",
              },
              {
                "label": "Editar",
                "value": "adm.sis.aplicacao.editar",
              },
              {
                "label": "Excluir",
                "value": "adm.sis.aplicacao.excluir",
              },
            ],
          },
          {
            "label": "Empresa",
            "value": "adm.sis.empresa",
            "children": [
              {
                "label": "Usuario",
                "value": "adm.sis.empresa.usuario",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.usuario.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.usuario.adicionar",
                    "children": [
                      {
                        "label": "Empresas Vinculadas",
                        "value": "adm.sis.empresa.usuario.adicionar.empresas_vinculadas",
                      },
                      {
                        "label": "Permissões do Usuário",
                        "value": "adm.sis.empresa.usuario.adicionar.permissoes_do_usuario",
                      },
                      // {
                      //   "label": "Email",
                      //   "value":
                      //     "adm.sis.empresa.usuario.adicionar.email",
                      // },
                      // {
                      //   "label": "Cargo",
                      //   "value":
                      //     "adm.sis.empresa.usuario.adicionar.cargo",
                      // },
                    ],
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.usuario.editar",
                    "children": [
                      {
                        "label": "Empresas Vinculadas",
                        "value": "adm.sis.empresa.usuario.editar.empresas_vinculadas",
                      },
                      {
                        "label": "Permissões do Usuário",
                        "value": "adm.sis.empresa.usuario.editar.permissoes_do_usuario",
                      },
                    ],
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.usuario.excluir",
                  },
                ],
              },
              {
                "label": "Permissões",
                "value": "adm.sis.empresa.permissoes",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.permissoes.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.permissoes.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.permissoes.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.permissoes.excluir",
                  },
                ],
              },
              {
                "label": "Contatos",
                "value": "adm.sis.empresa.contatos",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.contatos.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.contatos.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.contatos.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.contatos.excluir",
                  },
                ],
              },
              {
                "label": "Tipo de Contato",
                "value": "adm.sis.empresa.tipo_contato",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.tipo_contato.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.tipo_contato.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.tipo_contato.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.tipo_contato.excluir",
                  },
                ],
              },
              {
                "label": "Tipo de Email",
                "value": "adm.sis.empresa.tipo_email",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.tipo_email.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.tipo_email.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.tipo_email.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.tipo_email.excluir",
                  },
                ],
              },
              {
                "label": "Tipo de Telefone",
                "value": "adm.sis.empresa.tipo_telefone",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.tipo_telefone.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.tipo_telefone.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.tipo_telefone.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.tipo_telefone.excluir",
                  },
                ],
              },
              {
                "label": "Unidade de Medida",
                "value": "adm.sis.empresa.unidade_medida",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.unidade_medida.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.unidade_medida.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.unidade_medida.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.unidade_medida.excluir",
                  },
                ],
              },
              {
                "label": "Tipo de Ativo",
                "value": "adm.sis.empresa.tipo_de_ativo",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.tipo_de_ativo.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.tipo_de_ativo.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.tipo_de_ativo.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.tipo_de_ativo.excluir",
                  },
                ],
              },
              {
                "label": "Modelo de Ativo",
                "value": "adm.sis.empresa.modelo_de_ativo",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.modelo_de_ativo.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.modelo_de_ativo.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.modelo_de_ativo.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.modelo_de_ativo.excluir",
                  },
                ],
              },
              {
                "label": "Situação do Ativo",
                "value": "adm.sis.empresa.situacao_do_ativo",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.situacao_do_ativo.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.situacao_do_ativo.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.situacao_do_ativo.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.situacao_do_ativo.excluir",
                  },
                ],
              },
              {
                "label": "Fabricante do Ativo",
                "value": "adm.sis.empresa.fabricante_do_ativo",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.fabricante_do_ativo.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.fabricante_do_ativo.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.fabricante_do_ativo.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.fabricante_do_ativo.excluir",
                  },
                ],
              },
              {
                "label": "Categoria do Ativo",
                "value": "adm.sis.empresa.categoria_do_ativo",
                "children": [
                  {
                    "label": "Lista",
                    "value": "adm.sis.empresa.categoria_do_ativo.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.categoria_do_ativo.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.categoria_do_ativo.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.categoria_do_ativo.excluir",
                  },
                ],
              },
              {
                "label": "Situação do Passageiro",
                "value": "adm.sis.empresa.situacao_passageiro",
                "children": [
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.situacao_passageiro.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.situacao_passageiro.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.situacao_passageiro.excluir",
                  },
                ],
              },
              {
                "label": "Categoria de Cerca",
                "value": "adm.sis.empresa.categoria_de_cerca",
                "children": [
                  {
                    "label": "Adicionar",
                    "value": "adm.sis.empresa.categoria_de_cerca.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "adm.sis.empresa.categoria_de_cerca.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "adm.sis.empresa.categoria_de_cerca.excluir",
                  },
                ],
              },
            ],
          },
        ],
      },
      {
        "label": "Configuração",
        "value": "adm.cfg",
        "children": [
          {
            "label": "Equipamentos",
            "value": "adm.cfg.equipamentos",
            "children": [
              {
                "label": "Configuração",
                "value": "adm.cfg.equipamentos.configuracao",
              },
              {
                "label": "Fila de Processamento",
                "value": "adm.cfg.equipamentos.fila_processamento",
              },
              // { "label": "Buscar dados", "value": "buscar_dados" },
            ],
          },
        ],
      },
    ],
  },
  {
    "label": "Telemetria",
    "value": "telemetria_menu",
    "children": [
      {
        "label": "Frota",
        "value": "tlm.fro",
        "children": [
          {
            "label": "Ativo",
            "value": "tlm.fro.ativo",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.fro.ativo.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.fro.ativo.editar",
              },
              {
                "label": "Informações",
                "value": "tlm.fro.ativo.informacoes",
              },
              {
                "label": "Controle de Acesso",
                "value": "tlm.fro.ativo.controle_acesso",
              },
              {
                "label": "Equipamentos",
                "value": "tlm.fro.ativo.equipamentos",
              },
              {
                "label": "Prestar Serviço",
                "value": "tlm.fro.ativo.prestar_servico",
              },
              {
                "label": "Implementos",
                "value": "tlm.fro.ativo.implementos",
              },
              {
                "label": "Bloqueio do motor",
                "value": "tlm.fro.ativo.bloqueia_motor",
              },
            ],
          },
          {
            "label": "Motorista",
            "value": "tlm.fro.motorista",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.fro.motorista.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.fro.motorista.editar",
              },
              {
                "label": "Controle de Acesso",
                "value": "tlm.fro.motorista.controle_acesso",
              },
            ],
          },
          {
            "label": "Passageiro",
            "value": "tlm.fro.passageiro",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.fro.passageiro.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.fro.passageiro.editar",
              },
            ],
          },
          {
            "label": "Situação",
            "value": "tlm.fro.situacao",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.fro.situacao.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.fro.situacao.editar",
              },
            ],
          },
          {
            "label": "Grupo Genérico",
            "value": "tlm.fro.grupo_generico",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.fro.grupo_generico.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.fro.grupo_generico.editar",
              },
            ],
          },
          {
            "label": "Manutenções e Serviços",
            "value": "tlm.fro.manutencoes",
            "children": [
              {
                "label": "Recorrência",
                "value": "tlm.fro.manutencoes.recorrencia",
              },
              {
                "label": "Serviços",
                "value": "tlm.fro.manutencoes.servicos",
                "children": [
                  {
                    "label": "Adicionar",
                    "value": "tlm.fro.manutencoes.servicos.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "tlm.fro.manutencoes.servicos.editar",
                  },
                ],
              },
              {
                "label": "Periodicidades",
                "value": "tlm.fro.manutencoes.periodicidade",
                "children": [
                  {
                    "label": "Adicionar",
                    "value": "tlm.fro.manutencoes.periodicidade.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "tlm.fro.manutencoes.periodicidade.editar",
                  },
                ],
              },
              {
                "label": "Licenças",
                "value": "tlm.fro.manutencoes.licencas",
                "children": [
                  {
                    "label": "Adicionar",
                    "value": "tlm.fro.manutencoes.licencas.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "tlm.fro.manutencoes.licencas.editar",
                  },
                ],
              },
              {
                "label": "Documentos",
                "value": "tlm.fro.manutencoes.documentos",
                "children": [
                  {
                    "label": "Adicionar",
                    "value": "tlm.fro.manutencoes.documentos.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "tlm.fro.manutencoes.documentos.editar",
                  },
                ],
              },
            ],
          },
          {
            "label": "Garagem",
            "value": "tlm.fro.garagem",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.fro.garagem.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.fro.garagem.editar",
              },
            ],
          },
        ],
      },
      {
        "label": "Locais",
        "value": "tlm.cee",
        "children": [
          {
            "label": "Itinerários",
            "value": "tlm.cee.itinerarios",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.cee.itinerarios.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.cee.itinerarios.editar",
              },
            ],
          },
          {
            "label": "Prestadoras",
            "value": "tlm.cee.prestadoras",
            "children": [
              {
                "label": "Editar",
                "value": "tlm.cee.prestadoras.editar",
              },
            ],
          },
          {
            "label": "Linhas",
            "value": "linhas",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.cee.linhas.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.cee.linhas.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.cee.linhas.excluir",
              },
            ],
          },
          {
            "label": "Cercas",
            "value": "cercas",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.cee.cercas.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.cee.cercas.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.cee.cercas.excluir",
              },
            ],
          },
          {
            "label": "Embarcar Cercas",
            "value": "embarcar_cercas",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.cee.embarcar_cercas.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.cee.embarcar_cercas.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.cee.embarcar_cercas.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Operacional",
        "value": "tlm.ope",
        "children": [
          {
            "label": "Ultimos Registros",
            "value": "tlm.ope.ultimos_registros",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.ope.ultimos_registros.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.ope.ultimos_registros.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.ope.ultimos_registros.excluir",
              },
            ],
          },
          {
            "label": "Eventos",
            "value": "tlm.ope.eventos",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.ope.eventos.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.ope.eventos.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.ope.eventos.excluir",
              },
            ],
          },
          {
            "label": "Calendário",
            "value": "tlm.ope.calendario",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.ope.calendario.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.ope.calendario.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.ope.calendario.excluir",
              },
            ],
          },
          {
            "label": "Ativação",
            "value": "tlm.ope.ativacao",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.ope.ativacao.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.ope.ativacao.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.ope.ativacao.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Rastreamento",
        "value": "tlm.ras",
        "children": [
          {
            "label": "Ao vivo",
            "value": "tlm.ras.rastreamento_ao_vivo",
          },
          {
            "label": "Histórico de Rastreamento",
            "value": "tlm.ras.historico_rastreamento",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.ras.historico_rastreamento.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.ras.historico_rastreamento.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.ras.historico_rastreamento.excluir",
              },
            ],
          },
          {
            "label": "Registros",
            "value": "tlm.ras.registros",
            "children": [
              {
                "label": "Visualizar",
                "value": "tlm.ras.registros.visualizar",
              },
            ],
          },
          {
            "label": "Linha do Tempo",
            "value": "tlm.ras.linha_tempo",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.ras.linha_tempo.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.ras.linha_tempo.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.ras.linha_tempo.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Video Telemetria",
        "value": "tlm.vid",
        "children": [
          {
            "label": "Ao vivo",
            "value": "tlm.vid.video_ao_vivo",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.vid.video_ao_vivo.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.vid.video_ao_vivo.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.vid.video_ao_vivo.excluir",
              },
            ],
          },
          {
            "label": "Solicitar Download",
            "value": "tlm.vid.download",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.vid.download.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.vid.download.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.vid.download.excluir",
              },
            ],
          },
          {
            "label": "Configuração eventos de video",
            "value": "tlm.vid.configuracao",
            "children": [
              {
                "label": "Adicionar",
                "value": "tlm.vid.configuracao.adicionar",
              },
              {
                "label": "Editar",
                "value": "tlm.vid.configuracao.editar",
              },
              {
                "label": "Excluir",
                "value": "tlm.vid.configuracao.excluir",
              },
            ],
          },
        ],
      },
    ],
  },
  {
    "label": "Silometria",
    "value": "silometria",
    "children": [
      {
        "label": "Armazéns",
        "value": "sil.arm",
        "children": [
          {
            "label": "Localização",
            "value": "sil.arm.localizacao",
            "children": [
              {
                "label": "Lista",
                "value": "sil.arm.localizacao.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.arm.localizacao.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.arm.localizacao.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.arm.localizacao.excluir",
              },
            ],
          },
          {
            "label": "Armazém",
            "value": "sil.arm.armazem",
            "children": [
              {
                "label": "Lista",
                "value": "sil.arm.armazem.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.arm.armazem.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.arm.armazem.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.arm.armazem.excluir",
              },
            ],
          },
          {
            "label": "Cadastros",
            "value": "sil.arm.cadastros",
            "children": [
              {
                "label": "Lista",
                "value": "sil.arm.cadastros.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.arm.cadastros.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.arm.cadastros.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.arm.cadastros.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Manutenção Silometria",
        "value": "sil.man",
        "children": [
          {
            "label": "Ajuste de Sensor",
            "value": "sil.man.ajuste_sensor",
            "children": [
              {
                "label": "Lista",
                "value": "sil.man.ajuste_sensor.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.man.ajuste_sensor.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.man.ajuste_sensor.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.man.ajuste_sensor.excluir",
              },
            ],
          },
          {
            "label": "Instalação de sensor",
            "value": "sil.man.instalacao_sensor",
            "children": [
              {
                "label": "Lista",
                "value": "sil.man.instalacao_sensor.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.man.instalacao_sensor.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.man.instalacao_sensor.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.man.instalacao_sensor.excluir",
              },
            ],
          },
          {
            "label": "Erros dos sensores",
            "value": "sil.man.erro_sensor",
            "children": [
              {
                "label": "Lista",
                "value": "sil.man.erro_sensor.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.man.erro_sensor.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.man.erro_sensor.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.man.erro_sensor.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Monitoramento",
        "value": "sil.mon",
        "children": [
          {
            "label": "Acompanhamento",
            "value": "sil.mon.acompanhamento",
            "children": [
              {
                "label": "Lista",
                "value": "sil.mon.acompanhamento.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.mon.acompanhamento.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.mon.acompanhamento.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.mon.acompanhamento.excluir",
              },
            ],
          },
          {
            "label": "Sensores",
            "value": "sil.mon.sensores",
            "children": [
              {
                "label": "Lista",
                "value": "sil.mon.sensores.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.mon.sensores.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.mon.sensores.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.mon.sensores.excluir",
              },
            ],
          },
          {
            "label": "Equipamentos Instalados",
            "value": "sil.mon.equipamentos",
            "children": [
              {
                "label": "Lista",
                "value": "sil.mon.equipamentos.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.mon.equipamentos.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.mon.equipamentos.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.mon.equipamentos.excluir",
              },
            ],
          },
          {
            "label": "Comunicação silos",
            "value": "sil.mon.comunicacao",
            "children": [
              {
                "label": "Lista",
                "value": "sil.mon.comunicacao.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.mon.comunicacao.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.mon.comunicacao.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.mon.comunicacao.excluir",
              },
            ],
          },
          {
            "label": "Silos",
            "value": "sil.mon.silos",
            "children": [
              {
                "label": "Lista",
                "value": "sil.mon.silos.lista",
              },
              {
                "label": "Adicionar",
                "value": "sil.mon.silos.adicionar",
              },
              {
                "label": "Editar",
                "value": "sil.mon.silos.editar",
              },
              {
                "label": "Excluir",
                "value": "sil.mon.silos.excluir",
              },
            ],
          },
        ],
      },
    ],
  },
  {
    "label": "Relatórios",
    "value": "rel",
    "children": [
      {
        "label": "Configurador de Relatórios",
        "value": "rel.con",
        "children": [
          {
            "label": "Configurações",
            "value": "rel.con.configuracoes",
            "children": [
              {
                "label": "Lista",
                "value": "rel.con.configuracoes.lista",
              },
              {
                "label": "Adicionar",
                "value": "rel.con.configuracoes.adicionar",
              },
              {
                "label": "Editar",
                "value": "rel.con.configuracoes.editar",
              },
              {
                "label": "Excluir",
                "value": "rel.con.configuracoes.excluir",
              },
            ],
          },
          {
            "label": "Configuração Business Inteligence",
            "value": "rel.con.config_bi",
            "children": [
              {
                "label": "Lista",
                "value": "rel.con.config_bi.lista",
              },
              {
                "label": "Adicionar",
                "value": "rel.con.config_bi.adicionar",
              },
              {
                "label": "Editar",
                "value": "rel.con.config_bi.editar",
              },
              {
                "label": "Excluir",
                "value": "rel.con.config_bi.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Gestão à Vista",
        "value": "rel.ges",
        "children": [
          {
            "label": "Gestão à Vista",
            "value": "rel.ges.gestao_a_vista",
            "children": [
              {
                "label": "Lista",
                "value": "rel.ges.gestao_a_vista.lista",
              },
              {
                "label": "Adicionar",
                "value": "rel.ges.gestao_a_vista.adicionar",
              },
              {
                "label": "Editar",
                "value": "rel.ges.gestao_a_vista.editar",
              },
              {
                "label": "Excluir",
                "value": "rel.ges.gestao_a_vista.excluir",
              },
            ],
          },
        ],
      },
      {
        "label": "Relatórios",
        "value": "rel.rel",
        "children": [
          {
            "label": "Relatórios",
            "value": "rel.rel.relatorios",
            "children": [
              {
                "label": "Viagem",
                "value": "rel.rel.relatorios.viagem",
                "children": [
                  {
                    "label": "Lista",
                    "value": "rel.rel.relatorios.viagem.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "rel.rel.relatorios.viagem.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "rel.rel.relatorios.viagem.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "rel.rel.relatorios.viagem.excluir",
                  },
                ],
              },
              {
                "label": "Passageiro",
                "value": "rel.rel.relatorios.passageiro",
                "children": [
                  {
                    "label": "Lista",
                    "value": "rel.rel.relatorios.passageiro.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "rel.rel.relatorios.passageiro.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "rel.rel.relatorios.passageiro.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "rel.rel.relatorios.passageiro.excluir",
                  },
                ],
              },
            ],
          },
          {
            "label": "Relatórios Registros",
            "value": "rel.rel.relatorios_registros",
            "children": [
              {
                "label": "Ultimos Registros",
                "value": "rel.rel.relatorios_registros.ultimos_registros",
                "children": [
                  {
                    "label": "Lista",
                    "value": "rel.rel.relatorios_registros.ultimos_registros.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "rel.rel.relatorios_registros.ultimos_registros.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "rel.rel.relatorios_registros.ultimos_registros.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "rel.rel.relatorios_registros.ultimos_registros.excluir",
                  },
                ],
              },
              {
                "label": "Itinerários",
                "value": "rel.rel.relatorios_registros.itinerarios",
                "children": [
                  {
                    "label": "Lista",
                    "value": "rel.rel.relatorios_registros.itinerarios.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "rel.rel.relatorios_registros.itinerarios.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "rel.rel.relatorios_registros.itinerarios.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "rel.rel.relatorios_registros.itinerarios.excluir",
                  },
                ],
              },
              {
                "label": "Passageiros",
                "value": "rel.rel.relatorios_registros.passageiros",
                "children": [
                  {
                    "label": "Lista",
                    "value": "rel.rel.relatorios_registros.passageiros.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "rel.rel.relatorios_registros.passageiros.adicionar",
                  },
                  {
                    "label": "Editar",
                    "value": "rel.rel.relatorios_registros.passageiros.editar",
                  },
                  {
                    "label": "Excluir",
                    "value": "rel.rel.relatorios_registros.passageiros.excluir",
                  },
                ],
              },
            ],
          },
          {
            "label": "Formulários",
            "value": "rel.for",
            "children": [
              {
                "label": "Formulários",
                "value": "rel.for.formularios",
                "children": [
                  {
                    "label": "Lista",
                    "value": "rel.for.formularios.lista",
                  },
                  {
                    "label": "Adicionar",
                    "value": "rel.for.formularios.adicionar",
                  },
                ],
              },
            ],
          },
        ],
      },
    ],
  },
];

var userWiki = {
  "label": "Configuração",
  "value": "cfg",
  "children": [
    {
      "label": "Configuração",
      "value": "cfg.cfg",
      "children": [
        {
          "label": "Configuração",
          "value": "cfg.cfg.configuracao",
          "children": [
            {
              "label": "Empresa",
              "value": "cfg.cfg.configuracao.empresas",
              "children": [
                {
                  "label": "Listar",
                  "value": "cfg.cfg.configuracao.empresas.listar",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.configuracao.empresas.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.configuracao.empresas.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.configuracao.empresas.excluir",
                },
              ],
            },
          ],
        },
        {
          "label": "Vincular empresas com usuários",
          "value": "adm.sis.empresa.vincular",
          "children": [
            {
              "label": "Editar",
              "value": "adm.sis.empresa.vincular.editar",
            },
          ],
        },
        {
          "label": "Importação",
          "value": "cfg.cfg.importacao",
        },
        {
          "label": "Hardware",
          "value": "cfg.cfg.hardware",
          "children": [
            {
              "label": "Firmware",
              "value": "cfg.cfg.hardware.firmware",
              "children": [
                {
                  "label": "Lista",
                  "value": "cfg.cfg.hardware.firmware.lista",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.hardware.firmware.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.hardware.firmware.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.hardware.firmware.excluir",
                },
              ],
            },
            {
              "label": "Healthcheck",
              "value": "cfg.cfg.hardware.healthcheck",
              "children": [
                {
                  "label": "Lista",
                  "value": "cfg.cfg.hardware.healthcheck.lista",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.hardware.healthcheck.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.hardware.healthcheck.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.hardware.healthcheck.excluir",
                },
              ],
            },
            {
              "label": "Equipamento",
              "value": "cfg.cfg.hardware.equipamento",
              "children": [
                {
                  "label": "Lista",
                  "value": "cfg.cfg.hardware.equipamento.lista",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.hardware.equipamento.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.hardware.equipamento.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.hardware.equipamento.excluir",
                },
              ],
            },
            {
              "label": "Protocolos de Equipamento",
              "value": "cfg.cfg.hardware.protocolo",
              "children": [
                {
                  "label": "Lista",
                  "value": "cfg.cfg.hardware.protocolo.lista",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.hardware.protocolo.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.hardware.protocolo.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.hardware.protocolo.excluir",
                },
              ],
            },
            {
              "label": "Modelos de Equipamento",
              "value": "cfg.cfg.hardware.modelo",
              "children": [
                {
                  "label": "Lista",
                  "value": "cfg.cfg.hardware.modelo.lista",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.hardware.modelo.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.hardware.modelo.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.hardware.modelo.excluir",
                },
              ],
            },
            {
              "label": "Fabricantes de Equipamento",
              "value": "cfg.cfg.hardware.fabricante",
              "children": [
                {
                  "label": "Lista",
                  "value": "cfg.cfg.hardware.fabricante.lista",
                },
                {
                  "label": "Adicionar",
                  "value": "cfg.cfg.hardware.fabricante.adicionar",
                },
                {
                  "label": "Editar",
                  "value": "cfg.cfg.hardware.fabricante.editar",
                },
                {
                  "label": "Excluir",
                  "value": "cfg.cfg.hardware.fabricante.excluir",
                },
              ],
            },
          ],
        },
      ],
    },
    {
      "label": "Mapa",
      "value": "cfg.map",
      "children": [
        {
          "label": "Analise de Viagens",
          "value": "cfg.map.analise_viagens",
        },
        {
          "label": "Reconhecimento de Linhas",
          "value": "cfg.map.reconhecimento_linhas",
        },
      ],
    },
  ],
};
