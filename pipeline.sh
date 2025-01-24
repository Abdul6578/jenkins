pipeline {
    agent any
    
    triggers {
        parameterizedCron('''
        * * * * * %SERVICE_TIER=12345;BUDGET=WorkSubBudget;BUDGET_DOLLARS=9500
        ''')
    }
    parameters {
        string(name: 'SERVICE_TIER', defaultValue: '', description: 'Service Tier')
        string(name: 'BUDGET', defaultValue: '', description: 'Budget')
        string(name: 'BUDGET_DOLLARS', defaultValue: '', description: 'Budget in Dollars')
    }
    stages {
        stage('Run Job') {
            steps {
                echo "Running job with parameters: SERVICE_TIER=${params.SERVICE_TIER}, BUDGET=${params.BUDGET}, BUDGET_DOLLARS=${params.BUDGET_DOLLARS}"
                echo "ls"
            }
        }
    }
}
