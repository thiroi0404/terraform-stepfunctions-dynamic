import json
import os

def lambda_handler(event, context):
    """
    テスト用のシンプルなLambdaハンドラ関数です。
    受け取ったイベントの内容をログに出力し、
    成功メッセージとイベント内容を返します。
    """
    print("Lambda関数が呼び出されました。")
    print(f"受け取ったイベント: {json.dumps(event, indent=2)}")

    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Lambda関数が正常に実行されました！',
            'receivedEvent': event
        })
    }