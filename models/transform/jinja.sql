
{% set description ='hello world  this is my first jinja code' %}
{% set name= 'sanjeevini'%}
{% set course ='welcome and learning dbt with fun' %}

hey {{ description }}.let me  introduce myself.{{ name }} .and {{course}} its 5 day cource

{%- set payment_method =['credit_card','debit_card','gift_card','coups','bank_transfer','COD','cheque'] -%}

{{payment_method[0]}}
{{ payment_method[1]}}
{{ payment_method[2]}}
{{ payment_method[3]}}
{{ payment_method[4]}}
{{payment_method[5]}}
{{payment_method[6]}}
{%- set payment_method =['credit_card','debit_card','gift_card','coups','bank_transfer','COD','cheque'] -%}
{%- for payments in payment_method -%}
{{payments}}
{%  endfor  %}

{%- set payment_method =['credit_card','debit_card','gift_card','coups','bank_transfer','COD','cheque'] -%}
  {%- for payments in payment_method %}

      {%- if payment_method=='COD' -%}
           {%- set transcation_type='not recommined' -%}
  
        {%- else -%}
           {%- set transcation_type='good transfer'-%}
    {%- endif -%}
     Your payments which is {{ payments }} and it {{ transaction_type }} So be catious.     

{%- endfor -%}


    








